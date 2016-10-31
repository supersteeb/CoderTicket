class AddVenueToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :venue, foreign_key: true
  end
end
