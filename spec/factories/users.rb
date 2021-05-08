FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    first_name            {'名前'}
    second_name           {'名前'}
    first_name_kana       {'カナ'}
    second_name_kana      {'カナ'}
    birthday              {'2000-08-01'}
  end
end