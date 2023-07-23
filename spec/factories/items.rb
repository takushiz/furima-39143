FactoryBot.define do
  factory :item do
    item_name           {Faker::Lorem.sentence(word_count: 1)}
    description         {Faker::Lorem.sentence(word_count: 10)}
    category_id         {Faker::Number.between(from: 1, to: 10)}
    condition_id        {Faker::Number.between(from: 1, to: 6)}
    charge_id           {Faker::Number.between(from: 1, to: 2)}
    prefecture_id       {Faker::Number.between(from: 1, to: 47)}
    delivery_date_id    {Faker::Number.between(from: 1, to: 3)}
    price               {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end

    association :user
  end
end
