class AddColumnsToRounds < ActiveRecord::Migration[6.1]
  def change
    columns = %I[oro sette bello primera cards]

    columns.each do |column|
      add_column :rounds, column, :integer
    end

    add_column :rounds, :scopa_player0, :integer, default: 0
    add_column :rounds, :scopa_player1, :integer, default: 0
  end
end
