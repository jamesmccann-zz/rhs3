class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :num
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
