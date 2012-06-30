class Gun < ActiveRecord::Base
  attr_accessible :damage, :name, :price, :space, :clean  
  has_and_belongs_to_many :users
  has_and_belongs_to_many :agents
end
