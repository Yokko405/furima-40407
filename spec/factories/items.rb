FactoryBot.define do
  factory :item do
    association :user # Userモデルとの関連付け。

    name { "レディス・サングラス" }
    description { "これはテスト用のアイテムです。→サングラス" }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_payer_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { 500 }

    after(:build) do |item|
      # item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
  
    end
  end
end
