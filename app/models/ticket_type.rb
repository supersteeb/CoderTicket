class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :tickets
  before_create :check_duplicates

  def remaining_quantity
  	max_quantity - tickets.sum{|t| t.quantity}
  end

  def check_duplicates
    if TicketType.exists?(event: event, price: price)
      errors.add(:base, "Cannot have duplicates")
    end
  end

end


=begin 

create_table "ticket_types", force: :cascade do |t|
  t.integer  "event_id"
  t.integer  "price"
  t.string   "name"
  t.integer  "max_quantity"
  t.datetime "created_at",   null: false
  t.datetime "updated_at",   null: false
  t.integer  "buyer_id"

=end