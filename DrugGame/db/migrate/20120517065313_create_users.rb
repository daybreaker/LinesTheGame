class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :salt
      t.integer :wallet
      t.integer :days_remaining
      t.boolean :end_of_turn
      t.boolean :free
      t.integer :speed
      t.integer :accuracy
      t.integer :evasion
      t.integer :endurance
      t.integer :current_endurance
      t.integer :action
      t.integer :nextaction
      t.integer :spaces
      t.integer :location
      t.timestamps
    end
  end
end
