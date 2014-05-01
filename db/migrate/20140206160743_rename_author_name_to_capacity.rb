class RenameAuthorNameToCapacity < ActiveRecord::Migration
  def up
  rename_column :products, :author_name, :capacity
  end

  def down
  rename_column :products, :capacity, :author_name
  
  end
end
