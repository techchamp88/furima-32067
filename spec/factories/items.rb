FactoryBot.define do
  factory :item do
    association :user
    name                     {"猫"}
    explanation              {"あああ"}
    category_id              { 2 }
    status_id                { 2 }
    delivery_fee_id          { 2 }
    shipper_id               { 2 }
    delivery_day_id          { 2 }
    price                    { 600000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
