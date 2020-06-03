class AddDeliveryUrlToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :delivery_url, :string
  end
end
