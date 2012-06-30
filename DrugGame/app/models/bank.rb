class Bank < ActiveRecord::Base
  attr_accessible :interest, :loan_amount, :loan_interest, :savings_account
    
  def add_daily_interest
    dividend = self.savings_account * self.interest / 100
    self.savings_account += dividend - (dividend % 1)
    loan = self.loan_amount * self.loan_interest / 100
    self.loan_amount += loan - (loan % 1)
    self.save
  end

end
