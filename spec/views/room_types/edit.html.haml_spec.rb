require 'spec_helper'

describe "room_types/edit" do
  before(:each) do
    @room_type = assign(:room_type, stub_model(RoomType,
      :name => "MyString"
    ))
  end

  it "renders the edit room_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => room_types_path(@room_type), :method => "post" do
      assert_select "input#room_type_name", :name => "room_type[name]"
    end
  end
end
