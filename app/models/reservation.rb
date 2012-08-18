class Reservation < ActiveRecord::Base
  attr_accessible :arrival_date, :departure_date, :guest_id, :nights, :guest_attributes
  belongs_to :guest
  accepts_nested_attributes_for :guest
end
