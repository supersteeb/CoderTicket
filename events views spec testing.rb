require 'rails_helper'

RSpec.describe "events/index", type: :view do

	context "with 2 events" do
	    before do
	      @event1 = FactoryGirl.build(:event, :upcoming, name: "Event 1")
	      @event2 = FactoryGirl.build(:event, :past_event, name: "Event 2")
	      EventHelpers.create_list([@event1, @event2])
	      # assign
	      assign(:events, [@event1, @event2])
	    end

	    it "displays upcoming event" do
	      render

	      expect(rendered).to include "Event 1"
	    end

	    # code logic choose what to show is in controller, view only take part in show it correctly
	    it "displays past event" do
	      render

	      expect(rendered).to include "Event 2"
	    end

	    it "displays both events" do
	      render

	      expect(rendered).to include "Event 1"
	      expect(rendered).to include "Event 2"
	    end

	  end
  it "renders Discover upcoming events in a header tag" do
    assign(:events, [])
    render
    # if you want to see the whole rendered text, use 'puts rendered'
    expect(rendered).to include("<h2> Discover upcoming events </h2>")
  end

  it "displays an event title" do
    event = Event.create!(name: "Michael Jackson", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event",
                          venue: Venue.new, category: Category.new)
    assign(:events, [event])
    render
    expect(rendered).to include('<h4 class="card-title">Michael Jackson</h4>')
  end

=begin
    it "don't display pass events  title" do
    event = Event.create!(name: "Michael Jackson", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event",
                          venue: Venue.new, category: Category.new)
    assign(:events, [event])
    render
    expect(rendered).not_to include('<h4 class="card-title">Michael Jackson</h4>')
=end
end