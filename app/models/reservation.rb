class Reservation < ActiveRecord::Base
  attr_accessible :arrival_date, :departure_date, :guest_id, :nights, :guest_attributes, :allocation
  
  belongs_to :guest
  has_one :allocation
  accepts_nested_attributes_for :guest

  validates_presence_of :arrival_date, :departure_date, 
                        :nights, :guest

  delegate :name, :to => :guest, :prefix => :guest


  def self.reservations_list_by_date(date)
   result = Reservation.where("arrival_date = ?", date.to_date)
   return result
  end
end
