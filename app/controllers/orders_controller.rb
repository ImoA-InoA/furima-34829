class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :user_item, only: [:index, :create]
  
  def index
    @order_product_purchase = OrderProductPurchase.new
  end

  def create
    @order_product_purchase = OrderProductPurchase.new(order_params)
    if @order_product_purchase.valid?
      pay_item
      @order_product_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_product_purchase).permit(:postal_code, :area_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def user_item
    if current_user == @item.user && !@item.product_purchase.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
