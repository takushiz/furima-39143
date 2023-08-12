require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '購入登録' do
    context '購入できるとき' do
      it '郵便番号、都道府県、市区町村、番地、建物名、電話番号が存在すれば購入できる' do
      end
      it '建物名は存在しなくても購入できる（任意）' do
      end
    end

    context '購入できないとき' do
      it '郵便番号が存在しない場合は購入できない' do
      end
      it '郵便番号は、数値のみでは登録できない（「3桁ハイフン4桁」のみ受付）' do
      end
      it '都道府県が選択されていない場合は購入できない' do
      end
      it '市区町村が存在しない場合は購入できない' do
      end
      it '番地が存在しない場合は購入できない' do
      end
      it '電話番号が存在しない場合は購入できない' do
      end
      it '電話番号は全角文字では登録できない' do
      end
      it '電話番号は半角英字では登録できない' do
      end
      it '電話番号は10桁なければ登録できない' do
      end
      it '電話番号は12桁以上では登録できない' do
      end
      it '電話番号はハイフンを含めた入力では登録できない' do
      end
    end
  end
end
