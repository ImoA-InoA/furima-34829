require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録ができる時' do
      it '全てのデータが存在していれば保存できること' do
        expect(@item).to be_valid
      end


    end

    context '商品登録ができない時' do
      it 'product_nameが空では登録できないこと' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it 'category_idが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'status_idが空では登録できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

      it 'status_idが1では登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it 'burden_idが空では登録できないこと' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden is not a number")
      end

      it 'burden_idが1では登録できないこと' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it 'area_idが空では登録できないこと' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end

      it 'area_idが0では登録できないこと' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it 'delivery_idが空では登録できないこと' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery is not a number")
      end

      it 'delivery_idが1では登録できないこと' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceは全角文字では登録できないこと' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'priceは半角英数混合では登録できないこと' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'priceは半角英語だけでは登録できないこと' do
        @item.price = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'priceは299円以下では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'priceは10,000,000以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end
