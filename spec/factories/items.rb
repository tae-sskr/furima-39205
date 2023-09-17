FactoryBot.define do
  factory :item do
    category_id      { 2 }
    condition_id     { 3 }
    shipping_id      { 3 }
    prefecture_id    { 10 }
    schedule_id      { 3 }
    item_name        { '商品名' }
    explanation      { '商品の説明' }
    price            { '333' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
