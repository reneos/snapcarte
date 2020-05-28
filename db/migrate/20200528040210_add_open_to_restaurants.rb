class AddOpenToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :open, :boolean, default: false
  end
end
