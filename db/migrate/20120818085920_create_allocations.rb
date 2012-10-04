class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :reservation_id, :null => false
      t.integer :room_type_id, :null => false
      t.integer :room_id

      t.timestamps
    end
  end
end
