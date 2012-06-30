class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.boolean :clean
      t.integer :speed
      t.integer :accuracy
      t.integer :evasion
      t.integer :endurance
      t.integer :min_deputies
      t.integer :max_deputies
      t.integer :deputy_type
      t.integer :gun
      t.integer :deputy_gun
      t.timestamps
    end
  end
end
