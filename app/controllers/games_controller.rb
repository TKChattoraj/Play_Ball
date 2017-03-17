class GamesController < ApplicationController

  def index
    @games = Game.all
  end


  def new
    @game = Game.new

  end

  def show
    @game = Game.find(game_id)
  end

  def decide_game_view
    @game = Game.find(game_id)



    if !@game.winner && !@game.loser
      puts "in decide #{@game}"
      redirect_to edit_game_path(@game)

    else
      redirect_to @game
    end
  end

  def edit
    @team = applicable_team
    @game = Game.find(params[:id])
    @players = @team.players
    @hitting_stats = @game.game_hitting_stats
    @hitting_stats_array = []
    @players.each do |p|
      @hitting_stats_array << @hitting_stats.find{|s| s.player_id == p.id}
    end



  end


  def update
    @game = Game.find(params[:id])
    @game.update(game_score_params)
    if (@game.home_runs > @game.visitor_runs)
      @game.winner = @game.home
      @game.loser = @game.visitors
    end
    if (@game.visitor_runs > @game.home_runs)
      @game.winner = @game.visitors
      @game.loser = @game.home
    end
    @game.save


  end


  def create
    @game = Game.new(game_params)
    create_initial_game_stats(@game)
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
  def game_id
    params.require(:id)
  end
  def game_score_params
    params.require(:game).permit(:home_runs, :home_hits, :home_errors, :visitor_runs, :visitor_hits, :visitor_errors)
  end

  def create_initial_game_stats(game)
    create_game_stats(game, game.home)
    create_game_stats(game, game.visitors)
  end


  def create_game_stats(game, team)
    team.players.each do |p|
      stat = GameHittingStat.new(game: game, player: p)
      stat.save
    end
  end

end
