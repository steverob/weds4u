class AddWebsiteToProducts < ActiveRecord::Migration
  def change
    add_column :products, :website, :string
  end
end
