class ChangeUserLocationToCityId < ActiveRecord::Migration
  def up
    rename_column :users, :location, :city_id
  end

  def down
    rename_column :users, :city_id, :location
  end
end
