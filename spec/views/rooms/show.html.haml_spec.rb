require 'spec_helper'

describe "rooms/show" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
      :num => 1,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
