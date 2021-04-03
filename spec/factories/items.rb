FactoryBot.define do
  factory :item do
    product_name {Faker::Lorem.sentence}
    description  {Faker::Lorem.sentence}
    category_id  {2}
    status_id    {2}
    burden_id    {2}
    area_id      {2}
    delivery_id  {2}
    price        {2000}
    association :user

    after(:build) do |itemimage|
      itemimage.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
