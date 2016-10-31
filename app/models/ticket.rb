class Ticket < ApplicationRecord
  belongs_to :ticket_type
  #belongs_to :buyer, class_name: "User"

  validate :ticket_quantity
  validates :quantity, numericality: {greater_than: 0, only_integer: true}

  private

  def ticket_quantity
  		# TODO: this is only correct for a specific user
  		# TODO: count total of the available tickets for this ticket_type
  	if ticket_type && quantity && quantity > ticket_type.remaining_quantity  #(if have ticket type and quantity for tickets purchased AND purchased quantity is graeter than ticket_type.max_quaantity)
  		errors.add(:quantity, "can't be greater than #{ticket_type.remaining_quantity} remaining tickets.")
  	end 
  end

end
