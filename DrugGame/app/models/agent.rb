class Agent < ActiveRecord::Base
  attr_accessible :accuracy, :endurance, :evasion, :max_deputies,
  :min_deputies, :name, :speed, :clean, :deputy_type,
  :deputy_gun, :gun
end
