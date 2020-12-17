FactoryBot.define do
  factory :pay do
    association :user
    association :item
    post_code                      { "999-9999" }
    shipper_id                     { 4 }
    city                           {"東京"}
    address                        {"足立区"}
    tel_num                        { 99999999999 } 
    token                          {"sampletokensampletoken"}
    building                       {"柳ビル"}
  end
end
