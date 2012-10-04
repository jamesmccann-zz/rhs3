require 'spec_helper'

describe "room_types/new" do
  before(:each) do
    assign(:room_type, stub_model(RoomType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new room_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => room_types_path, :method => "post" do
      assert_select "input#room_type_name", :name => "room_type[name]"
    end
  end
end
