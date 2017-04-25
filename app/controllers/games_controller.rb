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
    @game.determine_winner_loser

    @team = applicable_team
    @team.determine_wins_loss_pct
    @team.determine_games_back

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
    @players.each do |player|
      calculate_hitting_totals(player)
    end

    redirect_to team_path(@team)


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
      individual_hitting = hitting_stats_hash[key].symbolize_keys.slice(:ab, :pa, :single, :double, :tripple, :hr, :bb, :error, :fc, :hb, :wp, :pb, :sb, :rbi, :r, :earned_run, :sac, :k)
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

  def calculate_hitting_totals(p)
    hitting_totals = HittingTotal.find_by!(player_id: p.id)
    game_hitting_stats = GameHittingStat.where(player_id: p.id)

    hitting_totals.g = 0
    hitting_totals.pa = 0
    hitting_totals.ab = 0
    hitting_totals.h = 0
    hitting_totals.bb = 0
    hitting_totals.b1 = 0
    hitting_totals.b2 = 0
    hitting_totals.b3 = 0
    hitting_totals.hr = 0
    hitting_totals.k =  0
    hitting_totals.sf = 0
    hitting_totals.err = 0
    hitting_totals.hb = 0
    hitting_totals.rbi = 0
    hitting_totals.r = 0
    hitting_totals.sb = 0
    hitting_totals.cs = 0
    hitting_totals.ave = 0.000
    hitting_totals.obp = 0.000
    hitting_totals.slg = 0.000

    game_hitting_stats.each do |gs|

      hitting_totals.pa = hitting_totals.pa + gs.pa
      hitting_totals.ab = hitting_totals.ab + gs.ab
      hitting_totals.bb = hitting_totals.bb + gs.bb
      hitting_totals.b1 = hitting_totals.b1 + gs.single
      hitting_totals.b2 = hitting_totals.b2 + gs.double
      hitting_totals.b3 = hitting_totals.b3 + gs.triple
      hitting_totals.hr = hitting_totals.hr + gs.hr
      hitting_totals.k = hitting_totals.k + gs.k
      hitting_totals.sf = hitting_totals.sf + gs.sac
      hitting_totals.err = hitting_totals.err + gs.error
      hitting_totals.hb = hitting_totals.hb + gs.hb
      hitting_totals.rbi = hitting_totals.rbi + gs.rbi
      hitting_totals.r = hitting_totals.r + gs.r
      hitting_totals.sb = hitting_totals.sb + gs.sb

    end
    hitting_totals.save
    hitting_totals.h = hitting_totals.b1 + hitting_totals.b2 + hitting_totals.b3 + hitting_totals.hr

    hitting_totals.ave = hitting_totals.h.fdiv(hitting_totals.ab)

    hitting_totals.obp = (hitting_totals.h + hitting_totals.bb + hitting_totals.hb).fdiv(hitting_totals.pa)



    total_bases = hitting_totals.b1 + hitting_totals.b2 * 2 + hitting_totals.b3 * 3 + hitting_totals.hr * 4

    hitting_totals.slg = total_bases.fdiv(hitting_totals.ab)
    hitting_totals.save
  end




end
