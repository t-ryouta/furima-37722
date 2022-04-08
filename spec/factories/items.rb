FactoryBot.define do
  factory :item do
    goods                 { Faker::Lorem.sentence }
    catch_copy            { Faker::Lorem.sentence }
    category_id           { Faker::Number.within(range: 2..11) }
    condition_id          { Faker::Number.within(range: 2..7) }
    burden_id             { Faker::Number.within(range: 2..3) }
    area_id               { Faker::Number.within(range: 2..48) }
    delivery_day_id       { Faker::Number.within(range: 2..4) }
    price                 { Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
