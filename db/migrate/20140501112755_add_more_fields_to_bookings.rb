class AddMoreFieldsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :user_id, :integer
    add_column :bookings, :product_id, :integer
    add_column :bookings, :name, :string
    add_column :bookings, :tel, :string
    add_column :bookings, :address, :string
    add_column :bookings, :guests_count, :integer
    add_column :bookings, :date, :integer
  end
end
