FactoryBot.define do
  factory :order_address do
    token          {"tok_abcdefghijk00000000000000000"}
    zip_code       {"123-4567"}
    prefecture     {rand(2..48)}
    city           {"横浜市緑区"}
    street_number  {"青山１−１−１"}
    building_name  {"柳ビル１０３"}
    phone_number   {"09012345678"}
  end
end