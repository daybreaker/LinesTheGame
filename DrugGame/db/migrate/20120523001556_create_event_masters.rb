class CreateEventMasters < ActiveRecord::Migration
  def change
    create_table :event_masters do |t|
      t.integer :user_id
      t.integer :event_chance
      t.integer :event_type
      t.integer :type_arg1
      t.integer :type_arg2
      t.integer :type_arg3
      t.integer :type_arg4
      t.string :message_str

      t.timestamps
    end
  end
end
