class Room < ActiveRecord::Base
  attr_accessible :description, :alias

  belongs_to :room_type
  has_many :allocations

  validates_presence_of :alias
  validates :description, :length => { :maximum => 150 }

end
