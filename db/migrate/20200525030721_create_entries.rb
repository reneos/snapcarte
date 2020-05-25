class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
