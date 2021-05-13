FactoryBot.define do
  factory :item do
  
  product             {'test'}
  product_description {'test'}
  category_id         {2}
  product_status_id   {2}
  delivery_charge_id  {2}
  shipment_id         {2}
  shipping_days_id    {2}
  price               {3000}

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.jpg'), filename: 'test_image.png')
    end
  end
end
