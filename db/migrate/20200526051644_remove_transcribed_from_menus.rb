class RemoveTranscribedFromMenus < ActiveRecord::Migration[6.0]
  def change
    remove_column :menus, :transcribed, :text
  end
end
