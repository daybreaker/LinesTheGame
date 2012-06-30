class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.boolean :clean
      t.integer :low_price
      t.integer :high_price
      t.integer :cheap_chance
      t.string :cheap_str
      t.string :cheap_str2
      t.integer :cheap_divide
      t.integer :expensive_chance
      t.string :expensive_str
      t.string :expensive_str2
      t.integer :expensive_multiply

      t.timestamps
    end

  end
end
