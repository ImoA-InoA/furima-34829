FactoryBot.define do
  factory :order_product_purchase do
    postal_code {"123-4567"}
    area_id {2}
    municipality {"横浜市緑区"}
    address {"青山1-1-1"}
    building {"三303"}
    phone_number {"09012345678"}
    token {"tk1234567890"}
  end
end
