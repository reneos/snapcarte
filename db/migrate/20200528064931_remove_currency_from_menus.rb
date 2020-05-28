class RemoveCurrencyFromMenus < ActiveRecord::Migration[6.0]
  def change
    remove_column :menus, :currency, :string
  end
end
