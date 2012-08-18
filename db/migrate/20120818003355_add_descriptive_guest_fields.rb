class AddDescriptiveGuestFields < ActiveRecord::Migration
  def up
    add_column :guests, :addr1, :string
    add_column :guests, :addr2, :string
    add_column :guests, :addr3, :string
    add_column :guests, :addr4, :string
    add_column :guests, :phone, :string
    add_column :guests, :mobile, :string
    add_column :guests, :email, :string
  end

  def down
    remove_column :guests, :addr1, :string
    remove_column :guests, :addr2, :string
    remove_column :guests, :addr3, :string
    remove_column :guests, :addr4, :string
    remove_column :guests, :phone, :string
    remove_column :guests, :mobile, :string
  end
end
