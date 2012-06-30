class Bag < ActiveRecord::Base
  attr_accessible :amount, :name, :price, :type_id
end
