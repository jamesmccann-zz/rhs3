# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  addr1      :string(255)
#  addr2      :string(255)
#  city       :string(255)
#  country    :string(255)
#  region     :string(255)
#  postcode   :string(255)
#  phone      :string(255)
#  mobile     :string(255)
#  email      :string(255)
#

class Guest < ActiveRecord::Base
  attr_accessible :name, 
                  :addr1, :addr2, :city, :region, :country, :postcode,
                  :phone, :mobile,
                  :email

  validates_presence_of :name

end
