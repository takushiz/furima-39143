FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    last_name             { '名' }
    first_name            { '姓' }
    last_name_kana        { 'メイ' }
    first_name_kana       { 'セイ' }
    birthday              { '19300101' }
  end
end
