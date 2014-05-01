class AddCityToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :city, :string
  end
end
