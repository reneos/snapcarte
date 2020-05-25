class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.boolean :exported, default: false
      t.string :currency

      t.timestamps
    end
  end
end
