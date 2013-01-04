# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_type_id :integer
#  alias        :string(255)
#

class Room < ActiveRecord::Base
  attr_accessible :description, :alias

  belongs_to :room_type
  has_many :allocations

  validates_presence_of :alias
  validates :description, :length => { :maximum => 150 }

  def reserved?(date)
  	self.allocations.each do |allocation|
      return true if allocation.within?(date)
    end
    false
  end

  def available?(date)
  	!reserved?(date)
  end

end
