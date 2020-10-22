FactoryBot.define do
  factory :item do
    name               { '机' }
    description        { 'この机は良い机です。' }
    genre_id           { 3 }
    status_id          { 3 }
    ship_burden_id     { 3 }
    shipment_source_id { 3 }
    days_to_id         { 3 }
    price              { 555 }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/furima-intro04.png'),
        filename: 'furima-intro04.png')
    end
  end
end
