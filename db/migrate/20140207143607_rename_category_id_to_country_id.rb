class RenameCategoryIdToCountryId < ActiveRecord::Migration
  def up
	rename_column :products, :category_id, :country_id
  end

  def down
	rename_column :products, :country_id, :category_id
  end
end
