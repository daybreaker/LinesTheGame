class GunInstance < ActiveRecord::Base
  attr_accessible :encounter_id, :name, :type_id, :user_id
end
