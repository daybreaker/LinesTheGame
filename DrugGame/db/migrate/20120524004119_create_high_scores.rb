class CreateHighScores < ActiveRecord::Migration
  def change
    create_table :high_scores do |t|
      t.string :name
      t.integer :score
      t.boolean :alive

      t.timestamps
    end
  end
end
