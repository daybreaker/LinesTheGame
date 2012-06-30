class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :clean
      t.integer :enemy_chance
      t.integer :event_chance
      t.integer :min_units
      t.integer :max_units
      t.integer :always_unit
      t.boolean :bank
      t.boolean :loanshark
      t.boolean :shop
      t.boolean :pub
      t.boolean :hospital

      t.timestamps
    end
  end
end
