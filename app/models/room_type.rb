class RoomType < ActiveRecord::Base
  attr_accessible :name

  has_many :rooms 
  has_many :allocations

  validates_presence_of :name
  validates :name, :length => { :maximum => 30 }

end
