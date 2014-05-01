class AddRegionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :region_id, :integer
  end
end
