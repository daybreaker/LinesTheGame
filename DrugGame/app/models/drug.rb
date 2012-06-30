class Drug < ActiveRecord::Base
  attr_accessible :cheap_chance, :cheap_divide, :cheap_str, :cheap_str2, :clean, :expensive_chance, :expensive_multiply, :expensive_str, :expensive_str2, :high_price, :low_price, :name

  def self.street_price(drug,user)
    low = drug.low_price
    high = drug.high_price
    price = rand((high-low)/2) + rand((high-low)/2) + low
    if rand(100) < drug.cheap_chance
      price = price/drug.cheap_divide
      if rand(2) == 1
        user.messages.create(:name => drug.cheap_str)
      else
        user.messages.create(:name => drug.cheap_str2)
      end
    else
      if rand(100) < drug.expensive_chance
        price = price*drug.expensive_multiply
        if rand(2) == 1
          user.messages.create(:name => drug.expensive_str)
        else
          user.messages.create(:name => drug.expensive_str2)
        end
      end
    end
    price
  end
  
end