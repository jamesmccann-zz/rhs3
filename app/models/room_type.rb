# == Schema Information
#
# Table name: room_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomType < ActiveRecord::Base
  attr_accessible :name

  has_many :rooms 
  has_many :allocations

  validates_presence_of :name
  validates :name, :length => { :maximum => 30 }

  def count
    return self.rooms.count
  end

  def available_for(date)
    allocated = 0
    allocations = Allocation.joins(:reservation).where("room_type_id = ?", id)
    allocations.each do |allocation|
      allocated += 1 if allocation.within?(date)
    end
    return count - allocated
  end

end
