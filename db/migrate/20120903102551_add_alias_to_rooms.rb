class AddAliasToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :alias, :string
    remove_column :rooms, :num
    remove_column :rooms, :name
  end
end
