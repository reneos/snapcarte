class ChangePriceToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :dishes, :price, :float
  end
end
