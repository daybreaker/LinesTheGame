class Follower < ActiveRecord::Base
  attr_accessible :name, :type_id, :current_endurance, :user_id, :encounter_id
end
