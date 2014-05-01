class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :user_name

      t.timestamps
    end
  end
end
