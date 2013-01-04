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

require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
