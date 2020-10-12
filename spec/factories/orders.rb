FactoryBot.define do
  factory :order do
    token          {"tok_abcdefghijk00000000000000000"}
    zip_code       {123-4567}
    prefecture     {rand(2..48)}
    city           {"横浜市緑区"}
    street_number  {"青山１−１−１"}
    bunilding_name {"柳ビル１０３"}
    phone_number   {"09012345678"}

    association :user
    association :item
  end
end
