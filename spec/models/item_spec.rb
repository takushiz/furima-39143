require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context "商品出品できるとき" do
      it "item_name,description,category_id,condition_id,charge_id,prefecture_id,delivery_date_id,price,user_idが存在すれば出品できる" do
          expect(@item).to be_valid
      end
    end

    context "商品出品できないとき" do
      it "画像が登録されていないと出品できない" do
        @item.image = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が入力されていないと出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品名が41文字以上では出品できない" do
        @item.item_name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end
      it "商品説明が入力されていないと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "商品説明が1001文字以上では出品できない" do
        @item.description = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it "カテゴリーが選択されていないと出品できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態を選択していないと出品できない" do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担を選択していないと出品できない" do
        @item.charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "発送元の地域を選択していないと出品できない" do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数を選択していないと出品できない" do
        @item.delivery_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "価格は空欄では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格は全角文字では出品できない" do
        @item.price = "テスト"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格は英字では出品できない" do
        @item.price = "test"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格は299円以下では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "価格は9,999,999円を超えると出品できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

    end
  end

end
