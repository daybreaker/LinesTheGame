class CreateDrugWarsData < ActiveRecord::Migration
  def up
    Drug.create(:name => 'Ludes', :clean => false,
    :low_price => 11, :high_price => 60, 
    :cheap_chance => 10,
    :cheap_str => 'Rival drug dealers raided a pharmacy and are selling cheap ludes!',
    :cheap_str2 => 'A rogue chemist has created cheap ludes to sell!',
    :cheap_divide => 4,
    :expensive_chance => 5,
    :expensive_str => 'A big party coming up has increased the demand for ludes!',
    :expensive_str2 => 'The local ludes dealer has been busted!',
    :expensive_multiply => 2)
    
    Drug.create(:name => 'Rufies', :clean => false,
    :low_price => 17, :high_price => 82, 
    :cheap_chance => 10,
    :cheap_str => 'Rival drug dealers raided a pharmacy and are selling cheap rufies!',
    :cheap_str2 => 'A rogue chemist has created cheap rufies to sell!',
    :cheap_divide => 4,
    :expensive_chance => 5,
    :expensive_str => 'Some guy wants to buy large amounts of rufies and is willing to pay a lot.',
    :expensive_str2 => 'The local rufies dealer has been busted!',
    :expensive_multiply => 3)    

    Drug.create(:name => 'Crystal Meth', :clean => false,
    :low_price => 90, :high_price => 250, 
    :cheap_chance => 0,
    :expensive_chance => 10,
    :expensive_str => 'Cops made a big meth bust! Prices are outrageous!',
    :expensive_str2 => 'Addicts are buying meth at ridiculous prices!',
    :expensive_multiply => 4)

    Drug.create(:name => 'Peyote', :clean => false,
    :low_price => 220, :high_price => 700, 
    :cheap_chance => 0,
    :expensive_chance => 0)

    Drug.create(:name => 'Weed', :clean => false,
    :low_price => 315, :high_price => 890, 
    :cheap_chance => 10,
    :cheap_str => 'Columbian freighter dusted the Coast Guard! Weed prices have bottomed out!',
    :cheap_str2 => 'A truck has just gotten in from Humboldt county.',
    :cheap_divide => 4,
    :expensive_chance => 0)
    
    Drug.create(:name => 'Hashish', :clean => false,
    :low_price => 480, :high_price => 1280, 
    :cheap_chance => 10,
    :cheap_str => 'The Marrakesh Express has arrived!',
    :cheap_str2 => 'A local club is offering hash at rock bottom prices.',
    :cheap_divide => 4,
    :expensive_chance => 0)
    
    Drug.create(:name => 'Opium', :clean => false,
    :low_price => 540, :high_price => 1250, 
    :cheap_chance => 0,
    :expensive_chance => 10,
    :expensive_str => 'Cops made a big opium bust! Prices are outrageous!',
    :expensive_str2 => 'Addicts are buying opium at ridiculous prices!',
    :expensive_multiply => 4)
    
    Drug.create(:name => 'Shrooms', :clean => false,
    :low_price => 630, :high_price => 1300, 
    :cheap_chance => 0,
    :expensive_chance => 0)
    
    Drug.create(:name => 'Oxycotin', :clean => false,
    :low_price => 450, :high_price => 1600,
    :cheap_chance => 5,
    :cheap_str => 'Rival drug dealers raided a pharmacy and are selling cheap oxycotin',
    :cheap_str2 => 'A rogue chemist has created cheap oxycotin to sell!',
    :cheap_divide => 4,
    :expensive_chance => 5,
    :expensive_str => 'Cops made a big oxycotin bust! Prices are outrageous!',
    :expensive_str2 => 'Addicts are buying oxycotin at ridiculous prices!',
    :expensive_multiply => 4)
    
    Drug.create(:name => 'GHB', :clean => false,
    :low_price => 700, :high_price => 1750, 
    :cheap_chance => 0,
    :expensive_chance => 0)
        
    Drug.create(:name => 'Acid', :clean => false,
    :low_price => 1000, :high_price => 4400, 
    :cheap_chance => 10,
    :cheap_str => 'The market is flooded with cheap home-made acid!',
    :cheap_str2 => 'A local hippie festival is supplying lots of cheap acid.',
    :cheap_divide => 4,
    :expensive_chance => 0)
    
    Drug.create(:name => 'PCP', :clean => false,
    :low_price => 1000, :high_price => 2500, 
    :cheap_chance => 0,
    :expensive_chance => 0)
        
    Drug.create(:name => 'Ecstacy', :clean => false,
    :low_price => 1500, :high_price => 4400, 
    :cheap_chance => 0,
    :expensive_chance => 0)
    
    Drug.create(:name => 'Special K', :clean => false,
    :low_price => 2500, :high_price => 8900,
    :cheap_chance => 5,
    :cheap_str => 'Rival drug dealers raided a pharmacy and are selling cheap special K',
    :cheap_str2 => 'A rogue chemist has created cheap special K to sell!',
    :cheap_divide => 3,
    :expensive_chance => 5,
    :expensive_str => 'Cops made a big special K bust! Prices are outrageous!',
    :expensive_str2 => 'Addicts are buying special K at ridiculous prices!',
    :expensive_multiply => 3)
    
    Drug.create(:name => 'Crack', :clean => false,
    :low_price => 1500, :high_price => 5400,
    :cheap_chance => 10,
    :cheap_str => 'The CIA has dumped huge amounts of cheap crack on the market.',
    :cheap_str2 => 'A rogue chemist has created cheap crack to sell!',
    :cheap_divide => 4,
    :expensive_chance => 10,
    :expensive_str => 'Cops made a big crack bust! Prices are outrageous!',
    :expensive_str2 => 'Addicts are buying crack at ridiculous prices!',
    :expensive_multiply => 4)
        
    Drug.create(:name => 'Heroin', :clean => false,
    :low_price => 5500, :high_price => 13000, 
    :cheap_chance => 0,
    :expensive_chance => 10,
    :expensive_str => 'Cops made a big heroin bust! Prices are outrageous!',
    :expensive_str2 => 'Addicts are buying heroin at ridiculous prices!',
    :expensive_multiply => 4)
    
    Drug.create(:name => 'Cocaine', :clean => false,
    :low_price => 15000, :high_price => 29000, 
    :cheap_chance => 0,
    :expensive_chance => 10,
    :expensive_str => 'Cops made a big cocaine bust! Prices are outrageous!',
    :expensive_str2 => 'Addicts are buying cocaine at ridiculous prices!',
    :expensive_multiply => 4)    

    City.create(:name => 'Richmond', :clean => true,
    :enemy_chance => 5, :event_chance => 15, 
    :min_units => 9, :max_units => 14,
    :bank => false,
    :loanshark => true,
    :shop => false,
    :pub => false,
    :hospital => false)

    City.create(:name => 'SF: Mission', :clean => true,
    :enemy_chance => 10, :event_chance => 15, 
    :min_units => 8, :max_units => 14, :always_unit => 15,
    :bank => false,
    :loanshark => false,
    :shop => true,
    :pub => true,
    :hospital => false)
                    
    City.create(:name => 'SF: Embarcaderro', :clean => true,
    :enemy_chance => 20, :event_chance => 10, 
    :min_units => 9, :max_units => 15,
    :bank => true,
    :loanshark => true,
    :shop => false,
    :pub => false,
    :hospital => false)
                        
    City.create(:name => 'SF: Sunset', :clean => true,
    :enemy_chance => 50, :event_chance => 5, 
    :min_units => 7, :max_units => 14, :always_unit => 16,
    :bank => false,
    :loanshark => false,
    :shop => true,
    :pub => false,
    :hospital => false)
                        
    City.create(:name => 'Berkeley', :clean => true,
    :enemy_chance => 70, :event_chance => 25, 
    :min_units => 6, :max_units => 12, :always_unit => 6,
    :bank => true,
    :loanshark => false,
    :shop => false,
    :pub => true,
    :hospital => false)
                            
    City.create(:name => 'Oakland', :clean => true,
    :enemy_chance => 15, :event_chance => 20, 
    :min_units => 7, :max_units => 13, :always_unit => 5,
    :bank => false,
    :loanshark => false,
    :shop => true,
    :pub => false,
    :hospital => true)
                    
    City.create(:name => 'Walnut Creek', :clean => true,
    :enemy_chance => 90, :event_chance => 5, 
    :min_units => 5, :max_units => 11, :always_unit => 3,
    :bank => true,
    :loanshark => false,
    :shop => false,
    :pub => false,
    :hospital => true)
                        
    City.create(:name => 'Hayward', :clean => true,
    :enemy_chance => 20, :event_chance => 5, 
    :min_units => 7, :max_units => 13, :always_unit => 9,
    :bank => false,
    :loanshark => true,
    :shop => false,
    :pub => false,
    :hospital => false)

    FollowerType.create(:name => 'Deputy', :clean => true,
    :hirable => false, :min_price => 25000, :max_price => 80000,
    :speed => 15, :accuracy => 15, :evasion => 25, :endurance => 10,
    :spaces => 10)

    FollowerType.create(:name => 'Cop', :clean => true,
    :hirable => false, :min_price => 50000, :max_price => 160000,
    :speed => 25, :accuracy => 35, :evasion => 25, :endurance => 20,
    :spaces => 10)

    FollowerType.create(:name => 'Agent', :clean => true,
    :hirable => false, :min_price => 80000, :max_price => 200000,
    :speed => 45, :accuracy => 45, :evasion => 35, :endurance => 30,
    :spaces => 10)

    FollowerType.create(:name => 'Bitch', :clean => false,
    :hirable => true, :min_price => 50000, :max_price => 160000,
    :speed => 45, :accuracy => 35, :evasion => 45, :endurance => 10,
    :spaces => 10)

    FollowerType.create(:name => 'Thug', :clean => false,
    :hirable => false, :min_price => 60000, :max_price => 180000,
    :speed => 35, :accuracy => 45, :evasion => 35, :endurance => 20,
    :spaces => 10)
    
    Gun.create(:name => 'Brass knuckle', :clean => false,
    :price => 1900, :space => 2, :damage => 2)
    
    Gun.create(:name => 'Baretta', :clean => false,
    :price => 2900, :space => 4, :damage => 4)
                
    Gun.create(:name => 'Ruger', :clean => false,
    :price => 3800, :space => 4, :damage => 5)
        
    Gun.create(:name => 'Saturday Night Special', :clean => false,
    :price => 5500, :space => 4, :damage => 7)
        
    Gun.create(:name => '.38 Special', :clean => false,
    :price => 7200, :space => 4, :damage => 9)    
     
    Gun.create(:name => 'AK-47', :clean => false,
    :price => 15000, :space => 8, :damage => 18)
        
    Agent.create(:name => 'Officer Hardass', :clean => false,
    :speed => 15, :accuracy => 35, :evasion => 25, :endurance => 50,
    :min_deputies => 0, :max_deputies => 3, :deputy_type => 1,
    :gun => 3, :deputy_gun => 2)

    Agent.create(:name => 'Detective Bob', :clean => true,
    :speed => 25, :accuracy => 35, :evasion => 45, :endurance => 75,
    :min_deputies => 2, :max_deputies => 4, :deputy_type => 2,
    :gun => 4, :deputy_gun => 3)
    
    Agent.create(:name => 'Agent Smith', :clean => true,
    :speed => 45, :accuracy => 55, :evasion => 45, :endurance => 100,
    :min_deputies => 3, :max_deputies => 5, :deputy_type => 3,
    :gun => 6, :deputy_gun => 4)
    
  end

  def down
  end
end
