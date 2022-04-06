class Player < ApplicationRecord
  belongs_to :game_players
  belongs_to :user
end
