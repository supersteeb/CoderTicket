require "rails_helper"

RSpec.describe "routing for events", :type => :routing do
  it "routes to events" do
    expect(:get => "/events").to be_routable
  end

  it "routes to events#show"  do
    expect(get: "/events/show").to be_routable
  end

  it "routes to events#mine"  do
    expect(get: "/events/mine").to be_routable
  end
end