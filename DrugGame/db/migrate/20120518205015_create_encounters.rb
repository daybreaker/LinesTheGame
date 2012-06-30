class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name
      t.integer :type_id
      t.integer :user_id
      t.integer :current_endurance
      t.integer :cash

      t.timestamps
    end
  end
end
