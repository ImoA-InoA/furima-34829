require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_product_purchase, item_id: @item.id, user_id: @user.id )
    sleep(1)
  end

  context '内容に問題ない場合' do
    
    it "建物名が空でも登録できる" do
      @order.building = ''
      @order.valid?
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では登録できないこと' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号にハイフンが必要であること" do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
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

    it "電話番号に文字列が含まれている場合は登録できないこと" do
      @order.phone_number = 'abcあいう'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号が12桁以上では登録できないこと" do
      @order.phone_number = 1234567891234
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it "user_idが空では登録できないこと" do
      @order.user_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では登録できないこと" do
      @order.item_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
