FactoryGirl.define do
  factory :guest do |f|
    f.name Faker::Name.name 
    f.addr1 Faker::Address.street_address
    f.city Faker::Address.city
    f.region Faker::Address.state
    f.country Faker::Address.country
    f.postcode Faker::Address.postcode
    f.email Faker::Internet.email
  end
end

