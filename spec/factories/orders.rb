FactoryBot.define do
  factory :order do
    
    postal_code     {"123-4567"}
    prefectures_id  {5}
    city            {"豊島区池袋"}
    address         {"4丁目"}
    phone_number    {"12345678901"}
  end
end
