FactoryBot.define do
  factory :orderForm do
    
    token           {"testtest"}
    postal_code     {"123-4567"}
    prefectures_id  {5}
    city            {"豊島区池袋"}
    address         {"4丁目"}
    building        {"森ビル1階"}
    phone_number    {"12345678901"}

    association :user
    association :item
  end
end
