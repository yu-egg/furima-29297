FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"岩本"}
    last_name             {"勇"}
    first_name_kana       {"イワモト"}
    last_name_kana        {"ユウ"}
    birthday              {"1989-2-10"}
  end
end