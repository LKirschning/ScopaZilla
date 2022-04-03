class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :winning_points
      t.integer :time_played
      t.string :winner
      t.integer :rounds_played

      t.timestamps
    end
  end
end
