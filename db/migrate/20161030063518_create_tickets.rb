class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :quantity
      t.references :ticket_type, foreign_key: true

      t.timestamps
    end
  end
end
