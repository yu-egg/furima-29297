FactoryBot.define do
  factory :item do
    # image                   {Railsの処理の流れ_0409.png}
    name                    {Faker::Name.initials(number: 2)}
    text                    {Faker::Lorem.sentence}
    category_id             {3}
    product_status_id       {2}
    presence_of_shipping_id {3}
    shipping_origin_id      {2}
    date_of_shipment_id     {2}
    price                   {"300"}
  end
end
