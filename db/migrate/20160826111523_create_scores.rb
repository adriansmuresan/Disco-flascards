class CreateScores < ActiveRecord::Migration
  def change
     create_table :scores do |t|
      t.integer :first_time_correct, null: false
      t.integer :total_guesses, null: false
      t.integer :round_id, null: false
      t.integer :card_id, null: false

      t.timestamps(null: false)
    end
  end
end
