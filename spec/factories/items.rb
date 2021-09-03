FactoryBot.define do
  factory :item do

    title                     {"商品名"}
    introduction              {"商品の説明"}
    category_id               {1}
    status_id                 {1}
    fee_id                    {1}
    shipping_id               {1}
    item_prefecture_id        {1}
    price                     {1000} 
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/output-image2.png'), filename: 'output-image2.png')
    end

  end
   
end
