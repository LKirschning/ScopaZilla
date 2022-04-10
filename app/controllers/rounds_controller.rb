class RoundsController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    @round = Round.new
    @round.game = @game
  end

  def create
    @game = Game.find(params[:game_id])
    @round = Round.new(round_params)
    @round.game = @game
    if @round.save
      redirect_to game_rounds_path(@game)
    else
      render :new
    end
  end

  def index
    @game = Game.find(params[:game_id])
    @rounds = Round.where(game_id: @game)
  end

  private

  def round_params
    params.require(:round).permit(:oro, :sette, :primera, :cards, :scopa_loser, :scopa_winner)
  end

end
