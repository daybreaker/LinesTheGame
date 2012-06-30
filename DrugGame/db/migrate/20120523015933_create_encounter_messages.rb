class CreateEncounterMessages < ActiveRecord::Migration
  def change
    create_table :encounter_messages do |t|
      t.string :name
      t.integer :encounter_id

      t.timestamps
    end
  end
end
