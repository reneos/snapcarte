class ChangePickupTimeCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :pickup_time
    add_column :carts, :pickup_time, :datetime
  end
end
