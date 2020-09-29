FactoryBot.define do
  factory :item do
    name                    {Faker::Name.initials(number: 2)}
    text                    {Faker::Lorem.sentence}
    category_id             {3}
    product_status_id       {2}
    presence_of_shipping_id {3}
    shipping_origin_id      {2}
    date_of_shipment_id     {2}
    price                   {"300"}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
