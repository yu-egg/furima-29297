FactoryBot.define do
  factory :user do
    nickname             {"abe"}
    email                {"kkk@gmail.com"}
    password             {"12345qwert"}
    first_name           {"岩本"}
    last_name            {"勇"}
    first_name_kana      {"イワモト"}
    last_name_kana       {"ユウ"}
    birthday             {"1989-2-10"}
  end
end