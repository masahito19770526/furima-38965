require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do 
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入出来る場合' do
      it '全ての情報が正しく入力されている時' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameが空の時' do
        @purchase_address.building_name = ''
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入出来ない時' do
      it 'zip_codeが空の時' do
        @purchase_address.zip_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeの正規表現が守られていない時' do
        @purchase_address.zip_code = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空の時' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1の時' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空の時' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'block_numberが空の時' do
        @purchase_address.block_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block number can't be blank")
      end

      it 'phone_numberが空の時' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberの正規表現が守られてない時' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが9桁以下の時' do
        @purchase_address.phone_number = '080123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上の時' do
        @purchase_address.phone_number = '080123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空の時' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'item_idが空の時' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空の時' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
