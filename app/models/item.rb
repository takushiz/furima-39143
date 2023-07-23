
class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :image, presence: true

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :delivery_date_id
    validates :prefecture_id
  end

  with_options presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }, format: { with: /\A[1-9]\d*\z/, message: "is invalid. Input half-width characters" } do
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :charge
    belongs_to :delivery_date
    belongs_to :prefecture
  
end
