class DropCartItems < ActiveRecord::Migration[6.0]
  def change
    drop_table :cart_items
  end
end
