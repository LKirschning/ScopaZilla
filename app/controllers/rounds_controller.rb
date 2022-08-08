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
    @round = calculate_round_points(@round)
    if @round.save
      redirect_to game_rounds_path(@game)
    else
      render :new
    end
  end

  def calculate_round_points(round)
    # this should be in the model
    player0 = 0
    player1 = 0
    [round.oro, round.sette, round.primera, round.cards].each do |element|
      if element == 0
        player0 += 1
      elsif element == 1
        player1 += 1
      end
    end
      player0 += round.scopa_player0 unless round.scopa_player0.nil?
      player1 += round.scopa_player1 unless round.scopa_player1.nil?
      round.points_player0 = player0
      round.points_player1 = player1
      round
  end

  def calculate_total_points()
    player0 = 0 
    player1 = 0
    Round.where(game_id: @game).each do |round|
      player0 += round.points_player0
      player1 += round.points_player1
    end
    [player0 ,player1]
  end

  def index
    @game = Game.find(params[:game_id])
    @rounds = Round.where(game_id: @game)
    @total_player0 = calculate_total_points[0]
    @total_player1 = calculate_total_points[1]
  end

  private

  def round_params
    params.require(:round).permit(:oro, :sette, :primera, :cards, :scopa_player0, :scopa_player1)
  end

end
