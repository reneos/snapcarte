class RemoveTotalFromCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :total, :integer
  end
end
