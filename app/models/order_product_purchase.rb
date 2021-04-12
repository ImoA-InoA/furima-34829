class OrderProductPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building, :phone_number, :item_id, :user_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    product_purchase = ProductPurchase.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, phone_number: phone_number, product_purchase_id: product_purchase.id)
  end
end