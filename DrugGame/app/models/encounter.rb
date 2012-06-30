class Encounter < ActiveRecord::Base
  attr_accessible :current_endurance, :name, :type_id, :user_id, :cash
  has_many :followers
  has_many :gun_instances
  has_many :encounter_messages
  
  def running
    cur_agent = Agent.find_by_id(self.type_id)
    total = cur_agent.speed + cur_agent.endurance
    self.followers.all.each do |npc|
        total += FollowerType.find_by_id(npc.type_id).speed + FollowerType.find_by_id(npc.type_id).endurance
    end
    rand(total)
  end
  
  def defending
    cur_agent = Agent.find_by_id(self.type_id)
    total = cur_agent.evasion
    self.followers.all.each do |npc|
        total += FollowerType.find_by_id(npc.type_id).evasion
    end
    rand(total)
  end
  
  def attacking
    cur_agent = Agent.find_by_id(self.type_id)
    total = cur_agent.accuracy
    self.followers.all.each do |npc|
        total += FollowerType.find_by_id(npc.type_id).accuracy
    end
    rand(total)
  end
    
  def damage
    damage = 0
    self.gun_instances.all.each do |enc_gun|
        damage += Gun.find_by_id(enc_gun.type_id).damage
    end
    damage
  end
  
  def hurt(damage, hurter)
    damage_cur = damage
    if self.followers.exists?
      self.followers.all.each do |npc|
          npc.current_endurance -= damage_cur
          npc.save
          if npc.current_endurance < 1
            npc.delete
            self.encounter_messages.create(:name => "You take out an enemy henchmen.")
            if self.gun_instances.count > self.followers.count + 2
              self.gun_instances.order(:type_id).all.each do |gun_drop|
                if hurter.gun_instances.count < hurter.followers.count + 2 and hurter.spaces_free >= Gun.find_by_id(gun_drop.type_id).space
                  self.encounter_messages.create(:name => "You grab a weapon the enemy dropped.")
                  hurter.gun_instances.create(:name => gun_drop.name, :type_id => gun_drop.type_id)
                end
                gun_drop.delete
                break
              end
            end
          end
          return
      end
    else
      self.current_endurance -= damage_cur
      if self.current_endurance < 1
       moneytext = "%d" % self.cash
       moneytext = "You win and find $" + moneytext
       self.gun_instances.all.each do |gun_drop|
         if hurter.gun_instances.count < hurter.followers.count + 2 and hurter.spaces_free >= Gun.find_by_id(gun_drop.type_id).space
           self.encounter_messages.create(:name => "You grab a weapon the enemy dropped.")
           hurter.gun_instances.create(:name => gun_drop.name, :type_id => gun_drop.type_id)
         end
         gun_drop.delete
         break
       end
       self.encounter_messages.create(:name => moneytext)
       hurter.wallet += self.cash
       self.type_id=0
       if !(Agent.find_by_id(hurter.action+1).nil?)
          hurter.action += 1
       end 
       hurter.save
      end
    end
    return
  end

end
