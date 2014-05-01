class RemoveGenreFromCountries < ActiveRecord::Migration
  def up
    remove_column :countries, :genre
      end

  def down
    add_column :countries, :genre, :string
  end
end
