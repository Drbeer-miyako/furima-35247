FactoryBot.define do
  factory :item do
    content {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.png')
    end
  end
end
