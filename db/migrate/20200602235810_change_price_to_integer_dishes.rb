class ChangePriceToIntegerDishes < ActiveRecord::Migration[6.0]
  def change
    change_column :dishes, :price, :integer
  end
end
