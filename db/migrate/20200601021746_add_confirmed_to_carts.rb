class AddConfirmedToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :confirmed, :integer
  end
end
