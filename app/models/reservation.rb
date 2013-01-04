# == Schema Information
#
# Table name: reservations
#
#  id             :integer          not null, primary key
#  arrival_date   :date
#  departure_date :date
#  nights         :integer
#  guest_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Reservation < ActiveRecord::Base
  attr_accessible :arrival_date, :departure_date, :guest_id, :nights, :guest_attributes, :allocation
  
  belongs_to :guest
  has_one :allocation, :dependent => :destroy
  accepts_nested_attributes_for :guest

  validates_presence_of :arrival_date, :departure_date, 
                        :nights, :guest

  delegate :name, :to => :guest, :prefix => :guest

  def self.reservations_list_by_date(date)
   reservations = Reservation.where("arrival_date = ?", date.to_date)
   reservations.sort_by {|e| e.guest_name} unless reservations.blank?
  end
end
