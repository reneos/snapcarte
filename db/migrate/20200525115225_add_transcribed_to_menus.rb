class AddTranscribedToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :transcribed, :text
  end
end
