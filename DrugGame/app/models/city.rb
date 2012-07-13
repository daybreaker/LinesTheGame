class City < ActiveRecord::Base
  has_many :users
  
  def amount_units
    rand((self.max_units-self.min_units)) + self.min_units
  end
  
  def encounter_roll(user)
    if self.enemy_chance > rand(100)
      agent_next = Agent.find_by_id(user.action+1)
      user.create_encounter(:type_id => agent_next.id, :current_endurance => agent_next.endurance, :name => agent_next.name, :cash => (rand(1000)+500)*agent_next.id) 
      user.encounter.gun_instances.create(:name => Gun.find_by_id(agent_next.gun).name, :type_id => agent_next.gun)
      deputies = rand(agent_next.max_deputies-agent_next.min_deputies) + agent_next.min_deputies
      count = 0
      deputy_kind = FollowerType.find_by_id(agent_next.deputy_type)
      while count < deputies
        user.encounter.followers.create(:name => deputy_kind.name, :current_endurance => deputy_kind.endurance, :type_id  => deputy_kind.id)
        user.encounter.gun_instances.create(:name => Gun.find_by_id(agent_next.deputy_gun).name, :type_id => agent_next.deputy_gun)
        count += 1
      end
    end
  end  
  
  def event_roll(user)
    if self.event_chance > rand(100)
      #user.create_encounter(:type_id => agent_next.id, :current_endurance => agent_next.endurance, :name => agent_next.name, :cash => (rand(1000)+500)*agent_next.id) 
    end
  end
  
end
