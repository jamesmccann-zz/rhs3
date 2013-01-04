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

require 'spec_helper'

describe Allocation do

  describe "validations" do
    before :each do 
      @room_type = FactoryGirl.create(:room_type)
      @room = FactoryGirl.create(:room)
      @reservation = FactoryGirl.build(:reservation)
      @allocation = Allocation.new
      @allocation.reservation_id = @reservation.id
    end

    it "requires a room type" do
      @allocation.room_type = nil
      @allocation.should_not be_valid
    end

    it "allows a type without a room" do
      @allocation.room_type = @room_type
      @allocation.should be_valid
    end

    it "should have match for room type and room" do
      other_room_type = RoomType.create(:name => "other")
      @allocation.room_type = other_room_type
      @allocation.room = @room
      @allocation.should_not be_valid 
    end 
  end
   
end
