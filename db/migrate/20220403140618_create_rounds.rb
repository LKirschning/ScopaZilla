class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :winner_points
      t.integer :loser_points
      t.string :winner
      t.string :loser

      t.timestamps
    end
  end
end
