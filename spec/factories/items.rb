FactoryBot.define do
  factory :item do
    name          {Faker::Ancient.god}
    description   {"これは説明です"}
    categories_id {rand(2..10)}
    state_id      {rand(2..7)}
    bearer_id     {rand(2..3)}
    area_id       {rand(2..48)}
    days_id       {rand(2..4)}
    price         {rand(300..9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
