class AddTypeToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :type, :integer
  end
end
