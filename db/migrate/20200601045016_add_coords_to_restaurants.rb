class AddCoordsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :coords, :string
  end
end
