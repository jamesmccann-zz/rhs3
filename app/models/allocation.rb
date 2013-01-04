# == Schema Information
#
# Table name: allocations
#
#  id             :integer          not null, primary key
#  reservation_id :integer          not null
#  room_type_id   :integer          not null
#  room_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Allocation < ActiveRecord::Base
  attr_accessible :reservation_id, :room, :room_type

  belongs_to :reservation
  belongs_to :room_type
  belongs_to :room

  delegate :num, :to => :room, :prefix => :room
  delegate :type, :to => :room_type, :prefix => :room_type
  delegate :num, :to => :reservation, :prefix => :reservation
  delegate :arrival_date, :to => :reservation
  delegate :departure_date, :to => :reservation
  delegate :nights, :to => :reservation

  #can be allocated by type or by room
  #but must have an explicit or implicit type regardless
  validates_presence_of :room_type
  validate :type_and_room_match, :unless => "room.nil?"

  def self.availability_by_type(start_date, end_date)
    i = 0
    types = RoomType.count
    availability = Array.new(types) { Array.new(end_date - start_date) }
    RoomType.all.each do |type|
      (0..availability[i].size).each do |day|
        current_date = start_date + day.days
        availability[i][day] = type.available_for(current_date)
      end
      i+=1
    end
    availability
  end

  def self.availability_by_room(start_date, end_date, room_type_id)
    i = 0
    rooms = Room.where(:room_type_id => room_type_id)
    availability = Array.new(rooms.size) { Array.new(end_date - start_date) }
    rooms.each do |room|
      (0..availability[i].size).each do |day|
        current_date = start_date + day.days
        availability[i][day] = room.available?(current_date) ? 1 : 0
      end
      i += 1
    end
    availability
  end

  def within?(date)
    date >= arrival_date && date < departure_date
  end

  private 

    def type_and_room_match
      if room.present? && room_type != room.room_type
        errors.add(:room_type, "Room type should match room")
      end
    end

end
