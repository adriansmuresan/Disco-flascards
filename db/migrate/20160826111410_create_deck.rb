class CreateDeck < ActiveRecord::Migration
  def change
     create_table :deck do |t|
      t.string :title, null: false

      t.timestamps(null: false)
    end
  end
end
