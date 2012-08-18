class Guest < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :addr1, :addr2, :addr3, :addr4
  attr_accessible :phone, :mobile
  attr_accessible :email
end
