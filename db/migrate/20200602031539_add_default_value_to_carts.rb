class AddDefaultValueToCarts < ActiveRecord::Migration[6.0]
  def change
    change_column :carts, :confirmed, :integer, default: 0
  end
end
