class Guest < ActiveRecord::Base
  attr_accessible :name, 
                  :addr1, :addr2, :addr3, :addr4,
                  :phone, :mobile,
                  :email

  validates_presence_of :name

end
