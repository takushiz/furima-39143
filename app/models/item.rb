
class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
  end
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :delivery_date_id
    validates :prefecture_id
  end

  with_options presence: true, numericality: {in: 299..9999999, message: "is out of setting range"}, numericality: { only_integer: true, message: "is invalid. Input half-width characters"} do
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :charge
    belongs_to :delivery_date
    belongs_to :prefecture
  
end
