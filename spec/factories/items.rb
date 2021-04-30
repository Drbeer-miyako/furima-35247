FactoryBot.define do
  factory :item do
    title                       {"hoge"}
    description                 {Faker::Lorem.sentence}
    category_id                 {1}
    prefecture_id               {1}
    status_id                   {1}
    delivery_charge_id          {1}
    delivery_date_indication_id {1}
    price                       {9999}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.png')
    end
  end
end
