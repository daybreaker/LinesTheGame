class CreateGuns < ActiveRecord::Migration
  def change
    create_table :guns do |t|
      t.string :name
      t.boolean :clean
      t.integer :price
      t.integer :space
      t.integer :damage

      t.timestamps
    end
  end
end
