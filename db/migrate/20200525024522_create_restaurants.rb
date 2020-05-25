class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :address
      t.string :name
      t.string :phone_number
      t.string :cuisine

      t.timestamps
    end
  end
end
