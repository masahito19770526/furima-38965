require 'rails_helper'

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品登録' do
      context '商品出品登録がうまくいくとき' do
        it '全ての値が正しく入力されていれば登録できる' do
          expect(@item).to be_valid
        end        
      end
      context '商品出品登録がうまくいかないとき' do
        it 'imageが空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空だと登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'descriptionが空だと登録できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'category_idが空だと登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'status_idが空だと登録できない' do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end

        it 'delivery_type_idが空だと登録できない' do
          @item.delivery_type_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery type can't be blank")
        end
        it 'shipping_area_idが空だと登録できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'days_to_ship_idが空だと登録できない' do
          @item.delivery_date_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date can't be blank")
        end
        it 'priceが空だと登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが¥300より小さいと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceが¥9,999,999より大きいと登録できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it 'priceが全角数字だと登録できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
end