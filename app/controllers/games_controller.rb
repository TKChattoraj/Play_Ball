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
    # configured_params = game_score_params
    # @game.update(game_score_params)
    # if (@game.home_runs > @game.visitor_runs)
    #   @game.winner = @game.home
    #   @game.loser = @game.visitors
    # end
    # if (@game.visitor_runs > @game.home_runs)
    #   @game.winner = @game.visitors
    #   @game.loser = @game.home
    # end
    # @game.save
    @team = applicable_team
    @players = @team.players

    hitting = hitting_params
    hitting.each do |key, value|

      hitting_id = key.to_i
      hitting_stats = GameHittingStat.find(hitting_id)

      hitting_stats.ab = value[:ab].to_i
      hitting_stats.pa = value[:pa].to_i
      hitting_stats.single = value[:single].to_i
      hitting_stats.double = value[:double].to_i

      hitting_stats.triple = value[:triple].to_i
      hitting_stats.hr = value[:hr].to_i
      hitting_stats.bb = value[:bb].to_i
      hitting_stats.error = value[:error].to_i

      hitting_stats.fc = value[:fc].to_i
      hitting_stats.hb = value[:hb].to_i
      hitting_stats.wp = value[:wp].to_i
      hitting_stats.pb = value[:pb].to_i

      hitting_stats.sb = value[:sb].to_i
      hitting_stats.rbi = value[:rbi].to_i
      hitting_stats.r = value[:r].to_i
      hitting_stats.earned_run = value[:earned_run].to_i
      hitting_stats.sac = value[:sac].to_i
      hitting_stats.k = value[:k].to_i


      hitting_stats.save
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
  def hitting_params
    hitting_hash = {}
    hitting_stats_hash = params['game_hitting_stats']
    hitting_stats_hash.each do |key, value|
      individual_hitting = hitting_stats_hash[key].symbolize_keys.slice(:pa, :single, :double, :tripple, :hr, :bb, :error, :fc, :hb, :wp, :pb, :sb, :rbi, :r, :earned_run, :sac, :k)
      hitting_hash[key] = individual_hitting
    end
    hitting_hash
  end

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
