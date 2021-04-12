require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order_product_purchase)
  end

  context '内容に問題ない場合' do
    
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では登録できないこと' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'municipalityが空では登録できないこと' do
      @order.municipality = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空では登録できないこと' do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では登録できないこと' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
