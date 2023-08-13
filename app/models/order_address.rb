class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :tel, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :municipalities
    validates :house_number
    validates :tel, length: { in: (10..11), too_short: 'number is too short', too_long: 'number is too long'}, numericality: { only_integer: true, message: 'is input only number' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
  end
  validates :prefecture_id, numericality: { only_integer: true, other_than: 0, message: 'Select' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                   house_number: house_number, building_name: building_name, tel: tel, order_id: order.id)
  end
end
