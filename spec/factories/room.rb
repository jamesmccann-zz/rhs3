FactoryGirl.define do
  factory :room do |f|
    f.description "Test room"
    f.alias "TEST"
    f.association :room_type, :factory => :room_type
  end
end
