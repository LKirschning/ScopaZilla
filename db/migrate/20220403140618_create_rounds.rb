class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.references :game, null: false
      t.integer :points_player0
      t.integer :points_player1

      t.timestamps
    end
  end
end
