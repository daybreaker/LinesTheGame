class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :name
      t.integer :current_endurance
      t.integer :type_id
      t.integer :user_id
      t.integer :encounter_id

      t.timestamps
    end
  end
end
