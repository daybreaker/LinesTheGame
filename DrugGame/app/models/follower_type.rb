class FollowerType < ActiveRecord::Base
  attr_accessible :accuracy, :clean, :endurance, :evasion, :name,
  :speed, :spaces, :hirable, :min_price, :max_price
end
