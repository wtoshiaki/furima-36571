FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    item_prefecture_id { 1 }
    city { '横浜市緑区' }
    house_number { '青山1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678' }
    
  end
end
