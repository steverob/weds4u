class RenamePubDateToContact < ActiveRecord::Migration
  def up
	rename_column :products, :date_published, :contact
  end

  def down
	rename_column :products, :contact, :date_published
  end
end
