FactoryGirl.define do
  factory :reservation do |f|
    f.arrival_date Date.today 
    f.association :guest, :factory => :guest
  end
end

