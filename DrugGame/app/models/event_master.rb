class EventMaster < ActiveRecord::Base
  attr_accessible :event_chance, :message_str, :event_type,
  :type_arg1, :type_arg2, :type_arg3, :type_arg4, :user_id
end
