class AccountController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
  end
  
  def new_game
    @user = User.find_by_id(session[:user_id])
    @user.new_game
    redirect_to :action => "index"
  end
  
  def travel
    @user = User.find_by_id(session[:user_id])
    @user.messages.clear
    @user.days_remaining -= 1
    if @user.days_remaining == 1
      @user.messages.create(:name => "Your trip ends tomorrow!")
    end
    @user.location = params[:location]
    @user.generate_market(@user)
    @user.bank.add_daily_interest
    current_city = City.find_by_id(@user.location) 
    current_city.encounter_roll(@user) 
    ######################################
    # What does this do?
    ######################################
    current_city.event_roll(@user)
    
    ######################################
    # Something about friends
    ######################################
    if @user.event.nil? and current_city.pub == true
      bitches = FollowerType.find_all_by_hirable(true)
      bitch_number = rand(bitches.count)
      bitch_current = 0
      bitches.each do |bitch_check|
        if (bitch_current == bitch_number)
          @pub_bitch = FollowerType.find_by_id(bitch_check.id)
        end
        bitch_current += 1
      end
      
      ##############################################################################
      # This creates the event that we ask whether the user wants to buy a friend
      #
      # Modified by len 29 Jun 2012
      ###############################################################################
      bitch_cost = rand(@pub_bitch.max_price-@pub_bitch.min_price)+@pub_bitch.min_price
     
      # added this check 29 Jun 2012 to see if we have enough money to buy a friend.
      # if we do not have enough money, then there's no reason to ask the user. 
      if @user.wallet >= bitch_cost
           @user.create_event(:event_type => 1, :type_arg1 => @pub_bitch.id, :type_arg2 => bitch_cost )
      end
      #####################################################
      # end of section added by len 29 Jun 2012
      #####################################################
    end
    redirect_to :action => "index"
    @user.save
  end
  
  def run
    @user = User.find_by_id(session[:user_id])
     @user.encounter.encounter_messages.clear
    if @user.defending < @user.encounter.attacking
      @user.current_endurance -= @user.encounter.damage
      @user.encounter.encounter_messages.create(:name => "You have been hit.")      

    else
      @user.encounter.encounter_messages.create(:name => "You avoid harm.")      
    end
    if @user.running > @user.encounter.running
      @user.encounter.encounter_messages.create(:name => "You got away.")
      @user.encounter.type_id=0
    else
      @user.encounter.encounter_messages.create(:name => "You fail to get away.")
    end
    @user.save
    @user.encounter.save
    redirect_to :action => "index"
  end
  
  def fight
    @user = User.find_by_id(session[:user_id])
     @user.encounter.encounter_messages.clear
    if @user.defending < @user.encounter.attacking
      @user.encounter.encounter_messages.create(:name => "You have been hit.")
      @user.hurt(@user.encounter.damage, @user.encounter)      
    else
      @user.encounter.encounter_messages.create(:name => "You avoid harm.")      
    end
    if @user.attacking > @user.encounter.defending
      @user.encounter.encounter_messages.create(:name => "You have stunned the enemy.")
      @user.encounter.hurt(@user.damage, @user)
    else
      @user.encounter.encounter_messages.create(:name => "You fail to stunned the enemy.")
    end
    redirect_to :action => "index"
    @user.save
    @user.encounter.save
  end
    
  def stay
    @user = User.find_by_id(session[:user_id])
    @user.encounter.encounter_messages.clear
    if !(@user.bags.exists?)
      @user.encounter.encounter_messages.create(:name => "You are searched and sent on your way.")
      @user.encounter.type_id=0
    end
    redirect_to :action => "index"
    @user.encounter.save
    @user.save
  end

  def hospital
    @user = User.find_by_id(session[:user_id])
    if !(@user.encounter.nil?)
      redirect_to :action => "index"
    end
    if !(@user.event.nil?)
      redirect_to :action => "index"
    end
  end
  
  def healing
    @user = User.find_by_id(session[:user_id])
      amount = params[:amount].to_i
      max_heal = (@user.endurance - @user.current_endurance) * 900
      if (amount < 0 or amount > @user.wallet)
        render :action => "hospital"
        return
      end
      if (amount > max_heal)
        amount = max_heal
      end
      amount -= amount % 900
      @user.current_endurance += amount / 900
      @user.wallet -= amount
      @user.save
      render :action => "index"
  end
    
  def event_reject
    @user = User.find_by_id(session[:user_id])
    @user.event.delete
    redirect_to :action => "index"
  end
  
  def event_accept
    @user = User.find_by_id(session[:user_id])
    cur_event = @user.event
    if cur_event.event_type = 1
      if @user.wallet >= cur_event.type_arg2
        @user.wallet -= cur_event.type_arg2
        follower = FollowerType.find_by_id(cur_event.type_arg1)
        @user.followers.create(:name => follower.name, :type_id => follower.id, :current_endurance => follower.endurance)
        @user.event.delete
        @user.save
      end
    end
    redirect_to :action => "index"
  end
  
  def bank
    @user = User.find_by_id(session[:user_id])
    if !(@user.encounter.nil?)
      redirect_to :action => "index"
    end
    if !(@user.event.nil?)
      redirect_to :action => "index"
    end
  end
  
  def savings
    @user = User.find_by_id(session[:user_id])
    if params[:commit] == "Deposit"
      amount = params[:amount].to_i
      if (amount < 0 or amount > @user.wallet)
        render :action => "bank"
        return
      end
      @user.bank.savings_account += amount
      @user.wallet -= amount
      @user.bank.save
      @user.save
    else
      amount = params[:amount].to_i
      if (amount < 0 or amount > @user.bank.savings_account)
        render :action => "bank"
        return
      end
      @user.bank.savings_account -= amount
      @user.wallet += amount
      @user.bank.save
      @user.save
    end
    render :action => "bank"    
  end  
  
  def loanshark
    @user = User.find_by_id(session[:user_id])
    if params[:commit] == "Repay"
      amount = params[:amount].to_i
      if (amount < 0 or amount > @user.wallet)
        render :action => "bank"
        return
      end
      if amount > @user.bank.loan_amount
        amount = @user.bank.loan_amount
      end
      @user.bank.loan_amount -= amount
      @user.wallet -= amount
      @user.bank.save
      @user.save
    else
      amount = params[:amount].to_i
      if (amount < 0 or 4999 < @user.bank.loan_amount+amount)
        render :action => "bank"
        return
      end
      @user.bank.loan_amount += amount
      @user.wallet += amount
      @user.bank.save
      @user.save
    end
    render :action => "bank"
  end
  
  def buy
    @user = User.find_by_id(session[:user_id])
      
    # len added this sanity check 29 Jun 2012  
    if params[:amount].blank?
      buy_amount = 0
    else
      buy_amount = params[:amount]
    end
    
    buy_amount = Integer(buy_amount)
    price = params[:price]
    price = Integer(price)
    if @user.wallet < (buy_amount * price)
      buy_amount = @user.wallet / price
      
      # Added this line 29 Jun 2012 by len
      flash[:notice] = "Your wallet had enough to buy " + buy_amount.to_s() + " " + params[:name] 
      # end of section added by len 29 Jun 2012
    end
    if @user.spaces_free < buy_amount
      buy_amount = @user.spaces_free
      
      # Added this line 29 Jun 2012 by len
       flash[:notice] = "You  had enough space to carry " + buy_amount.to_s() + " " + params[:name] 
       # end of section added by len 29 Jun 2012
    end
    if buy_amount == 0
      redirect_to :action => "index"
      return
    end
    purchase = buy_amount * price
    if @user.bags.exists?(:type_id => params[:type_id])
      cur_bag = @user.bags.find_by_type_id(params[:type_id])
      cur_bag.price = (purchase+(cur_bag.amount*cur_bag.price))/(buy_amount+cur_bag.amount)
      cur_bag.amount += buy_amount
      cur_bag.save
    else
      @user.bags.create(:name => params[:name], :price => params[:price], :type_id => params[:type_id], :amount => buy_amount)
    end
    @user.wallet -= purchase
    redirect_to :action => "index"
    @user.save
  end
  
  
  ########################
  # sell
  ########################
  def sell
    @user = User.find_by_id(session[:user_id])
      
    # len modified this 29 Jun 2012 to ensure users put a valid amount there
    if params[:amount].blank?
      sell_amount = 0
    else
      sell_amount = params[:amount]
    end
    
    sell_amount = Integer(sell_amount)
    price = params[:price]
    price = Integer(price)
    
    if @user.bags.exists?(:type_id => params[:type_id])
      cur_bag = @user.bags.find_by_type_id(params[:type_id])
      if cur_bag.amount < (sell_amount)
        
        # Added this line 29 Jun 2012 by len
        flash[:notice] = "You had only " + cur_bag.amount.to_s() + " " + params[:name] + " to sell."
        # end of section added by len 29 Jun 2012
               
        sell_amount = cur_bag.amount
      end
    else
      redirect_to :action => "index"
      return
    end
    
    cur_bag.amount -= sell_amount
    
    # Added this line 29 Jun 2012 by len
    cur_bag.save
    # end of line added by len 29 Jun 2012
    
    @user.wallet += price*sell_amount
    @user.save
    if cur_bag.amount == 0
      cur_bag.delete
    end
    redirect_to :action => "index"
  end
  
  def shop
    @user = User.find_by_id(session[:user_id])
    if !(@user.encounter.nil?)
      redirect_to :action => "index"
    end
    if !(@user.event.nil?)
      redirect_to :action => "index"
    end
  end
  

  def buy_gun
    @user = User.find_by_id(session[:user_id])
    buy_gun = Gun.find_by_id(params[:id])
    price = buy_gun.price
    the_name = buy_gun.name
    if @user.wallet < (price)
      
      # Added this line 29 Jun 2012 by len
      flash[:notice] = "Your wallet doesn't have enough to buy a " + the_name + "."
      # end of section added by len 29 Jun 2012
             
      redirect_to :action => "index"
      return
    end
    if (@user.spaces - @user.spaces_taken) < (buy_gun.space)
      
      # Added this line 29 Jun 2012 by len
      flash[:notice] = "Your backpack doesn't have enough space for a " + the_name + "."
      # end of section added by len 29 Jun 2012
              
      redirect_to :action => "index"
      return
    end
    if (@user.gun_instances.count > 1+@user.followers.count)
      
      # Added this line 29 Jun 2012 by len
      z = 1 + user.followers.count
      flash[:notice] = "You can only hold " + z.to_s() + " bought item(s) at a time.  Them's the rules!"
      # end of section added by len 29 Jun 2012
              
      redirect_to :action => "index"
      return
    end
    @user.gun_instances.create(:name => buy_gun.name, :type_id => buy_gun.id)
    @user.wallet -= price
    redirect_to :action => "index"
    @user.save
  end
  
  def sell_gun
    @user = User.find_by_id(session[:user_id])
    sell_gun = Gun.find_by_id(params[:id])
    price = sell_gun.price
    @user.gun_instances.find_by_type_id(params[:id]).destroy
    @user.wallet += price
    redirect_to :action => "index"
    @user.save
  end
  
  
  def registration
    if request.post? and params[:user]
      @user = User.new(params[:user])
      if @user.save
        User.find_by_username(@user.username).password_salt
        flash[:notice] = "User created."
        redirect_to :action => "index"
      end
    end
  end
   
  def login
    if request.post? and params[:user]
      @user = User.new(params[:user])
   
      user = User.find_by_username(@user.username)
   
      # If we found a user with that username and the password provided matches
      # the password on file for that user, we can login the user.
      if user and user.password_matches?(@user.password)
        session[:user_id] = user.id
        user.save
        redirect_to :action => "index"
      else
        flash[:notice] = "Sorry, no user was found with that username/password combination."
      end
    end
  end
  
end
