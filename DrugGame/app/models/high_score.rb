class HighScore < ActiveRecord::Base
  attr_accessible :alive, :score, :name
end
