require 'rails_helper'

RSpec.describe "events/index", :type => :view do
  it "renders _card partial for each event" do
    assign(:events, [double(Event), double(Event)])
    render
    expect(view).to render_template(:partial => "_card", :count => 2)
  end
end