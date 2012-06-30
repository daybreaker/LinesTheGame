class CreateGunInstances < ActiveRecord::Migration
  def change
    create_table :gun_instances do |t|
      t.string :name
      t.integer :type_id
      t.integer :user_id
      t.integer :encounter_id

      t.timestamps
    end
  end
end
