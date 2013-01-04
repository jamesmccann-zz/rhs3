class AddDescriptiveGuestFields < ActiveRecord::Migration
  def up
    add_column :guests, :addr1, :string
    add_column :guests, :addr2, :string
    add_column :guests, :city, :string
    add_column :guests, :country, :string
    add_column :guests, :region, :string
    add_column :guests, :postcode, :string
    add_column :guests, :phone, :string
    add_column :guests, :mobile, :string
    add_column :guests, :email, :string
  end

  def down
    remove_column :guests, :addr1
    remove_column :guests, :addr2
    remove_column :guests, :city
    remove_column :guests, :country
    remove_column :guests, :region
    remove_column :guests, :postcode
    remove_column :guests, :phone
    remove_column :guests, :mobile
    remove_column :guests, :email
  end
end
