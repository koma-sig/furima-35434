FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    first_name            {'test_first_name'}
    second_name           {'test_second_name'}
    first_name_kana       {'test_first_name_kana'}
    second_name_kana      {'test_second_name_kana'}
  end
end