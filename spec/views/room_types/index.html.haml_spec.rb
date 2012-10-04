require 'spec_helper'

describe "room_types/index" do
  before(:each) do
    assign(:room_types, [
      stub_model(RoomType,
        :name => "Name"
      ),
      stub_model(RoomType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of room_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
