class CreateRoundStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :round_statistics do |t|
      t.references :round, null: false, foreign_key: true
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
