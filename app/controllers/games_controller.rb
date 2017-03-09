class GamesController < ApplicationController

  def new
    @game = Game.new

  end

  def create
    @game = Game.new(game_params)
    # puts @game.location


    if @game.save
      flash[:notice] = "New Game Scheduled!"
      redirect_to games_path
    else
      flash[:notice] = "Could Not Schedule a Game.  Try Again."
      redirect_to new_games_path
    end
  end

private
  def game_params
    params.require(:game).permit(:home_id, :visitors_id, :location_id, :date, :time)
  end

end
