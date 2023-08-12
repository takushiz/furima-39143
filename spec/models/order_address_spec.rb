require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入履歴登録' do
    context '登録できる場合' do
      it 'user_idとitem_idが存在する場合は登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '登録できない場合' do
      it 'user_idが存在しない場合は登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが存在しない場合は登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

  describe '購入登録' do
    context '購入できるとき' do
      it '郵便番号、都道府県、市区町村、番地、建物名、電話番号、tokenが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名は存在しなくても購入できる（任意）' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号が存在しない場合は購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、数値のみでは登録できない（「3桁ハイフン4桁」のみ受付）' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it '都道府県が選択されていない場合は購入できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end
      it '都道府県の選択が「---」（0）の場合は購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が存在しない場合は購入できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が存在しない場合は購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が存在しない場合は購入できない' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号は全角文字では登録できない' do
        @order_address.tel = 'てすと'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is input only number')
      end
      it '電話番号は半角英字では登録できない' do
        @order_address.tel = 'testtesttes'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is input only number')
      end
      it '電話番号は10桁以上なければ登録できない' do
        @order_address.tel = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is too short')
      end
      it '電話番号はハイフンを含めた入力では登録できない' do
        @order_address.tel = '123-4567-8901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is input only number')
      end
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
