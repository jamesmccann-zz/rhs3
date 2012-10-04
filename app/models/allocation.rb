class Allocation < ActiveRecord::Base
  attr_accessible :reservation_id, :room, :room_type

  belongs_to :reservation
  belongs_to :room_type
  belongs_to :room
end
