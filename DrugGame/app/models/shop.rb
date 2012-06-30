class Shop < ActiveRecord::Base
  attr_accessible :name, :price, :type_id, :user_id
end
