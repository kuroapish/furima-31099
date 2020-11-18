FactoryBot.define do
  factory :address_purchase do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '111-1111' }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    phone_number   { '08011112222' }
    city           { '市町村' }
    address        { '1-2-3' }
    user_id        { 5 }
    item_id        { 5 }
  end
end
