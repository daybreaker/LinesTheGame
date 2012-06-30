class CreateFollowerTypes < ActiveRecord::Migration
  def change
    create_table :follower_types do |t|
      t.string :name
      t.integer :accuracy
      t.integer :endurance
      t.integer :evasion
      t.integer :speed
      t.integer :spaces
      t.boolean :hirable
      t.integer :min_price
      t.integer :max_price
      t.boolean :clean

      t.timestamps
    end
  end
end
