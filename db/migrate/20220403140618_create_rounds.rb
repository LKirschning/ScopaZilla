class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.references :game, null: false
      t.integer :winner_points
      t.integer :loser_points
      t.string :winner
      t.string :loser
      t.integer :oro
      t.integer :sette_bello
      t.integer :primera
      t.integer :cards
      t.integer :scopa_winner
      t.integer :scopa_loser

      t.timestamps
    end
  end
end
