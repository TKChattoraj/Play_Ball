class GamesController < ApplicationController

  def index
    @games = Game.all
    @games_by_date = @games.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

  end

  def new
    @game = Game.new

  end

  def show
    @game = Game.find(game_id)
  end

  def decide_game_view
    @game = Game.find(game_id)

    # if @game.winner.nil? || @game.loser.nil?
    #   flash[:notice] = "no winner/loser yet"
      redirect_to edit_game_path(@game)
    # else
      # redirect_to @game
    # end
  end

  def edit
    @game = Game.find(params[:id])
    @team = applicable_team
    unless (@team.id == @game.home_id || @team.id == @game.visitors_id)
      flash[:notice] = "Game not finished and you aren't athorized to update this game!"
      redirect_to games_path
    end
    @players = @team.players
    @hitting_stats = @game.game_hitting_stats
    @hitting_stats_array = []
    @players.each do |p|
      @hitting_stats_array << @hitting_stats.find{|s| s.player_id == p.id}
    end



  end


  def update
    puts("in update")
    @game = Game.find(params[:id])

    @game.update(game_score_params)
    if @game.winner.nil? || @game.loser.nil?
      @game.determine_winner_loser
    end

    @team = applicable_team

    @team.determine_wins_loss_pct
    Team.determine_games_back

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
    puts("updated hitting")
    pitching = pitching_params
    if pitching
      pitching.each do |key, value|
        pitching_id = key.to_i
        pitching_stats = GamePitchingStat.find(pitching_id)
        pitching_stats.batters_retired = value[:batters_retired].to_i
        pitching_stats.r = value[:r].to_i
        pitching_stats.er = value[:er].to_i
        pitching_stats.sv = value[:sv].to_i
        pitching_stats.cg = value[:cg].to_i
        pitching_stats.bf = value[:bf].to_i
        pitching_stats.bb = value[:bb].to_i
        pitching_stats.h = value[:h].to_i
        pitching_stats.single = value[:single].to_i
        pitching_stats.double = value[:double].to_i
        pitching_stats.triple = value[:triple].to_i
        pitching_stats.hr = value[:hr].to_i
        pitching_stats.k = value[:k].to_i
        pitching_stats.wp = value[:wp].to_i
        pitching_stats.hb = value[:hb].to_i
        pitching_stats.bk = value[:bk].to_i
        pitching_stats.sb = value[:sb].to_i

        pitching_stats.save
      end
    end
    @game.save
    puts("updated pitching")
    @players.each do |player|
      calculate_hitting_totals(player)

      if player.positions.include?(Position.find(1))
        calculate_pitching_totals(player)
      end

    end
    puts("redirecting to team")
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

  def pitching_params
    pitching_hash = {}
    pitching_stats_hash = params['game_pitching_stats']
    if pitching_stats_hash
      pitching_stats_hash.each do |key, value|
        individual_pitching =
        pitching_stats_hash[key].symbolize_keys.slice(:batters_retired, :r, :er, :sv, :cg, :bf, :bb, :h, :single, :double, :triple, :hr, :k, :wp, :hb, :bk, :sb)
        pitching_hash[key] = individual_pitching
      end
      pitching_hash
    end
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
      stat.ab = 0
      stat.pa = 0
      stat.single = 0
      stat.double = 0
      stat.triple = 0
      stat.hr = 0
      stat.bb = 0
      stat.error = 0
      stat.fc = 0
      stat.hb = 0
      stat.wp = 0
      stat.pb = 0
      stat.sb = 0
      stat.rbi = 0
      stat.r = 0
      stat.earned_run = 0
      stat.sac = 0
      stat.k = 0
      stat.save

      if p.positions.include?(Position.find(1))
        pstat = GamePitchingStat.new(game: game, player: p)
        pstat.batters_retired = 0
        pstat.r = 0
        pstat.er = 0
        pstat.sv = 0
        pstat.cg = 0
        pstat.bf = 0
        pstat.bb = 0
        pstat.h = 0
        pstat.single = 0
        pstat.double = 0
        pstat.triple = 0
        pstat.hr = 0
        pstat.k  = 0
        pstat.wp = 0
        pstat.hb = 0
        pstat.bk = 0
        pstat.sb = 0
        pstat.cs = 0
        pstat.save
      end
    end
  end

  def calculate_pitching_totals(p)
    pitching_totals = PitchingTotal.find_by!(player_id: p.id)
    game_pitching_stats = GamePitchingStat.where(player_id: p.id)

    pitching_totals.w = 0
    pitching_totals.l = 0
    # note:  ip===innings pitched will be calculated by
    # batters retired divided by 3

    pitching_totals.ip = 0
    pitching_totals.r = 0
    pitching_totals.er = 0
    pitching_totals.g = 0
    pitching_totals.gs = 0
    pitching_totals.sv = 0
    pitching_totals.cg = 0
    pitching_totals.bf = 0
    pitching_totals.bb = 0
    pitching_totals.h = 0
    pitching_totals.b1 = 0
    pitching_totals.b2 = 0
    pitching_totals.b3 = 0
    pitching_totals.hr = 0
    pitching_totals.k = 0
    pitching_totals.wp = 0
    pitching_totals.hb = 0
    pitching_totals.bk = 0
    pitching_totals.sb = 0
    pitching_totals.cs = 0
    pitching_totals.batters_retired = 0

    pitching_totals.era = 0.000

    game_pitching_stats.each do |ps|
      pitching_totals.batters_retired += ps.batters_retired
      pitching_totals.r += ps.r
      pitching_totals.er += ps.er
      if ps.bf > 0
       pitching_totals.g += 1
      end

      # need to create a game started game_pitching_stat
      #pitching_totals.gs += ps.gs


      pitching_totals.sv += ps.sv
      pitching_totals.cg += ps.cg
      pitching_totals.bf += ps.bf
      pitching_totals.bb += ps.bb
      pitching_totals.h += ps.h
      pitching_totals.b1 += ps.single
      pitching_totals.b2 += ps.double
      pitching_totals.b3 += ps.triple
      pitching_totals.hr += ps.hr
      pitching_totals.k += ps.k
      pitching_totals.wp += ps.wp
      pitching_totals.hb += ps.hb
      pitching_totals.bk += ps.bk
      pitching_totals.sb += ps.sb
      pitching_totals.cs += ps.cs

    end
    pitching_totals.save


    unless pitching_totals.batters_retired == 0
      pitching_totals.era = pitching_totals.er.fdiv(pitching_totals.batters_retired)*27
    end

    pitching_totals.save



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
    total_bases = hitting_totals.b1 + hitting_totals.b2 * 2 + hitting_totals.b3 * 3 + hitting_totals.hr * 4

    if hitting_totals.ab == 0
      hitting_totals.ave = 0
      hitting_totals.slg = 0
    else
      hitting_totals.ave = hitting_totals.h.fdiv(hitting_totals.ab)
      hitting_totals.slg = total_bases.fdiv(hitting_totals.ab)
    end

    if hitting_totals.pa == 0
      hitting_totals.obp = 0
    else

      hitting_totals.obp = (hitting_totals.h + hitting_totals.bb + hitting_totals.hb).fdiv(hitting_totals.pa)
    end

    hitting_totals.save
  end




end
