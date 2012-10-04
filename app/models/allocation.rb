class Allocation < ActiveRecord::Base
  attr_accessible :reservation_id, :room, :room_type

  belongs_to :reservation
  belongs_to :room_type
  belongs_to :room

  delegate :num, :to => :room, :prefix => :room
  delegate :type, :to => :room_type, :prefix => :room_type
  delegate :num, :to => :reservation, :prefix => :reservation
end
