class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :price
      t.integer :type_id
      t.integer :user_id

      t.timestamps
    end
  end
end
