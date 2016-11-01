require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "Associations" do
    it "belongs_to ticket_types" do
      assc = described_class.reflect_on_association(:ticket_types)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
