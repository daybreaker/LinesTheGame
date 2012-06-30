class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.integer :loan_amount
      t.integer :loan_interest
      t.integer :savings_account
      t.integer :interest
      t.integer :user_id

      t.timestamps
    end
  end
end
