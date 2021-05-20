FactoryBot.define do
  factory :order_address do
    user_id     { Faker::Internet.user_id(min_length: 1) }
    item_id     { Faker::Internet.item_id(min_length: 1) }
    postal_code { '111-1111' }
    shipment_id { 2 }
    municipality{ '盛岡'}
    address     { '1丁目1-1'}
    building_name{ 'testビルディング'}
    phone_number { '11111111111' }
    token        {"tok_abcdefghijk00000000000000000"}
  end
end
