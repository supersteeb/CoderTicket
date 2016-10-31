class AddBuyersToTicketTypes < ActiveRecord::Migration[5.0]
  def change
  	add_reference :ticket_types, :buyer, references: :users
  	add_foreign_key :ticket_types, :users, column: :buyer_id
  end
end
