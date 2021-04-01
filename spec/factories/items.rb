FactoryBot.define do
  factory :item do
    product_name {Faker::Lorem.sentence}
    description  {Faker::Lorem.sentence}
    category_id  {Faker::Number.between(1,11)}
    status_id    {Faker::Number.between(1,7)}
    burden_id    {Faker::Number.between(1,3)}
    area_id      {Faker::Number.between(0,47)}
    delivery_id  {Faker::Number.between(1,4)}
    price        {Faker::Number.between(300,9999999)}
    association :user

    after(:build) do |itemimage|
      itemimage.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
