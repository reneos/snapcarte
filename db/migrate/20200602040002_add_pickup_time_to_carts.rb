class AddPickupTimeToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :pickup_time, :time
  end
end
