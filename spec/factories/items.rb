FactoryBot.define do
  factory :item do
    # image {Faker::Lorem.sentence}
    name                  { "hoge"}
    description           { "商品の説明" }
    category_id           { '2' }
    status_id             { '2' }
    delivery_type_id      { '2' }
    prefecture_id         { '2' }
    delivery_date_id      { '2' }
    price                 {Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
    end

  end
end

