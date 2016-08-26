class CreateCards < ActiveRecord::Migration
  def change
     create_table :cards do |t|
      t.integer :deck_id, null: false
      t.text :question, null: false
      t.string :answer, null: false

      t.timestamps(null: false)
    end
  end
end
