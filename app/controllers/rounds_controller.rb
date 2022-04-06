class RoundsController < ApplicationController

  def new
    @round = Round.new
  end

  def create
    @game = Game.find(params[:id])
    @round = Round.new(round_params)
    @round.game = @game
    if @round.save
      redirect_to game_rounds_path
    else
      render :new
    end
  end

  def index
    @rounds = Round.all
  end

  private

  def round_params
    params.require(:round).permit(:oro, :sette_bello, :primera, :cards, :scopa_loser, :scopa_winner)
  end

end
