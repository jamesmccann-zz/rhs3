require 'spec_helper'

describe "rooms/edit" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
      :num => 1,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rooms_path(@room), :method => "post" do
      assert_select "input#room_num", :name => "room[num]"
      assert_select "input#room_name", :name => "room[name]"
      assert_select "input#room_description", :name => "room[description]"
    end
  end
end
