class AddPlayerAmountToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :player_amount, :integer
  end
end
