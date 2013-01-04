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

require 'spec_helper'

describe Room do
  pending "add some examples to (or delete) #{__FILE__}"
end
