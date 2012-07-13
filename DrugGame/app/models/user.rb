require "digest"
 
class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_presence_of :password
  validates_confirmation_of :password

  
  belongs_to :city
  has_one :bank, :dependent => :destroy
  has_one :encounter, :dependent => :destroy
  has_one :event, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :bags, :dependent => :destroy, :order => "name ASC"
  has_many :shops, :dependent => :destroy, :order => "name ASC"
  has_many :followers, :dependent => :destroy
  has_many :gun_instances, :dependent => :destroy
  
  
  def password_salt
    self.salt = "41369"
    self.password = Digest::MD5.hexdigest(self.salt + self.password)
    self.save
  end
  
  def password_matches?(password_to_match)
    self.password == Digest::MD5.hexdigest(self.salt + password_to_match)
  end
  
  def new_game
    if self.bank.nil?
      self.bank = Bank.create(:loan_amount => 5000,
      :loan_interest => 10.0, :savings_account => 0, :interest => 1.0)
    else
      self.bank.loan_amount = 5000
      self.bank.loan_interest = 10.0
      self.bank.savings_account = 0
      self.bank.interest = 1.0
      self.bank.save
    end      
    self.gun_instances.clear      
    self.followers.clear
    if !(self.encounter.nil?)
      self.encounter.delete
    end
    self.messages.clear
    if !(self.event.nil?)
      self.event.delete
    end
    self.bags.clear
    self.wallet = 2000
    self.spaces = 100
    self.speed = 50
    self.accuracy = 50
    self.evasion = 50
    self.endurance = 100
    self.current_endurance = self.endurance
    self.end_of_turn = false
    self.action = 0
    self.days_remaining = 5
    self.free = true
    self.city_id = 1
    self.action = 0
    self.generate_market(self)
    #Drug.all.each_with_index do |drug, select_number|
      #@user.shops.create(:name => drug.name, :price => Drug.street_price(drug), :type_id => drug.id)
    #end
    self.save
  end
  
  def generate_market(user)
    self.shops.clear
    userloc = self.city
    amount_units = userloc.amount_units
    cur_units = 0
    if userloc.always_unit.nil? == false
      drug = Drug.find_by_id(userloc.always_unit)
      self.shops.create(:name => drug.name, :price => Drug.street_price(drug,user), :type_id => drug.id)
      cur_units += 1
    end
    while cur_units < amount_units
      drug = Drug.find_by_id(rand(Drug.count)+1)
      if self.shops.exists?(:type_id => drug.id) == false
        self.shops.create(:name => drug.name, :price => Drug.street_price(drug,user), :type_id => drug.id)
        cur_units += 1
      end
    end
    self.shops.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end
  
  def running
    total = self.speed
    total += self.endurance
    self.followers.all.each do |npc|
        total += FollowerType.find_by_id(npc.type_id).speed + FollowerType.find_by_id(npc.type_id).endurance
    end
    rand(total)
  end
  
  
  def defending
    total = self.evasion
    self.followers.all.each do |npc|
        total += FollowerType.find_by_id(npc.type_id).evasion
    end
    rand(total)
  end
  
  def attacking
    total = self.accuracy
    self.followers.all.each do |npc|
        total += FollowerType.find_by_id(npc.type_id).accuracy
    end
    rand(total)
  end
  
  def hurt(damage, hurter)
    damage_cur = damage
    if self.followers.exists?
      self.followers.all.each do |npc|
          npc.current_endurance -= damage_cur
          npc.save
          if npc.current_endurance < 1
            npc.delete
            self.encounter.encounter_messages.create(:name => "One of your followers is asked to leave the park.")
            if self.gun_instances.count > self.followers.count + 2
              self.gun_instances.order(:type_id).all.each do |gun_drop|
                if hurter.gun_instances.count < hurter.followers.count + 2 #and hurter.spaces_free >= Gun.find_by_id(gun_drop.type_id).space
                  hurter.gun_instances.create(:name => gun_drop.name, :type_id => gun_drop.type_id)
                end
                gun_drop.delete
                break
              end
            end
            if self.spaces_free < 0
              self.bags.order(:price).all.each do |bag_drop|
                if bag_drop.amount > (self.spaces_free * -1)
                  bag_drop.amount -= (self.spaces_free * -1)
                  break
                else
                  bag_drop.delete
                  if self.spaces_free >= 0
                    break
                  end
                end
              end              
            end
          end
          return
      end
    else
      self.current_endurance -= damage_cur
      if self.current_endurance < 1
        self.free = false
        self.encounter.delete
      end
    end
    return
  end
    
  def damage
    damage = 0
    self.gun_instances.all.each do |enc_gun|
        damage += Gun.find_by_id(enc_gun.type_id).damage
    end
    damage
  end
  def spaces_free
    total = self.spaces_total - self.spaces_taken
    total
  end
  
  def spaces_total
    total = 0
    if self.followers.exists?
      userfols = self.followers.all 
      userfols.each do |fol|
        total += FollowerType.find_by_id(fol.type_id).spaces
      end
    end
    total += self.spaces
    total
  end
  
  def spaces_taken
    total = 0
    if self.bags.exists?
      userbags = self.bags.all 
      userbags.each do |bag|
        total += bag.amount
      end
    end
    if self.gun_instances.exists?
      userguns = self.gun_instances.all 
      userguns.each do |gun|
        total += Gun.find_by_id(gun.type_id).space
      end
    end
    total
  end
  
  private
  
end
