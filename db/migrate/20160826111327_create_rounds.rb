class CreateRounds < ActiveRecord::Migration
  def change
     create_table :rounds do |t|
      t.integer :first_time_correct, null: false
      t.integer :total_guesses, null: false
      t.integer :user_id, null: false
      t.integer :deck_id, null: false

      t.timestamps(null: false)
    end
  end
end
