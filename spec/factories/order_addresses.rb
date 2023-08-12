FactoryBot.define do
  factory :order_address do
    postal_code    { '111-1111' }
    prefecture_id  { 1 }
    municipalities { '福岡市博多区' }
    house_number   { '1-1-1' }
    building_name  { '博多ビル' }
    tel            { '09012345678' }
    item_id        { 1 }
    user_id        { 1 }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
