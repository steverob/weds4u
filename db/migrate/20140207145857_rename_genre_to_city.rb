class RenameGenreToCity < ActiveRecord::Migration
  def up
	rename_column :categories, :genre, :city
  end

  def down
	  rename_column :categories, :city, :genre
  end
end



