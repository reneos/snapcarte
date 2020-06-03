class ChangeTypeCarts < ActiveRecord::Migration[6.0]
  def change
    rename_column :carts, :type, :request_type
  end
end
