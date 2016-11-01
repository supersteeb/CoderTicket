require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  it "displays the event location" do
    assign(:event, Event.new(:venue_id => "1"))
    render
    expect(rendered).to include("Da Lat City")
  end
end