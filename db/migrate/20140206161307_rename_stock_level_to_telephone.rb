class RenameStockLevelToTelephone < ActiveRecord::Migration
  def up
  rename_column :products, :stock_level, :telephone
  
  end

  def down
  rename_column :products, :telephone, :stock_level
  
  end
end
