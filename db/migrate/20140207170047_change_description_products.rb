class ChangeDescriptionProducts < ActiveRecord::Migration
  def up
   change_column :products, :description, :text
  end

  def self.down
   change_column :products, :description, :string
  end
end
