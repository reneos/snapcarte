class AddTimeToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :time, :string
  end
end
