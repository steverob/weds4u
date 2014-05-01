class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.string :name
      t.text :review_text
      t.integer :no_of_stars

      t.timestamps
    end
  end
end
