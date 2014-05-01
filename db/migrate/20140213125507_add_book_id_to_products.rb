class AddBookIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :book_id, :integer
  end
end
