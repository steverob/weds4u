class AddAuthorNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :author_name, :string
	add_column :products, :stock_level, :integer
  end
end
