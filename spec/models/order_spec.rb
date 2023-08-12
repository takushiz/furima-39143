require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入履歴登録' do
    before do
      @order = FactoryBot.build(:order)
    end
    context '登録できる場合' do
      it 'user_idとitem_idが存在する場合は登録できる' do
        expect(@order).to be_valid
      end
    end

    context '登録できない場合' do
      it 'user_idが存在しない場合は登録できない' do
        @order.user_id = nil
        @order.valid?
        binding.pry
      end

      it 'item_idが存在しない場合は登録できない' do
      end
    end
  end
end
