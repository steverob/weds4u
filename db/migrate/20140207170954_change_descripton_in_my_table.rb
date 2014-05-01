class ChangeDescriptonInMyTable < ActiveRecord::Migration
  def up
	change_column :products, :description, :string
  end

  def down
	change_column :products, :description, :text
  end
end
