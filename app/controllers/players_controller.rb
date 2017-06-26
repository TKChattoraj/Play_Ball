class PlayersController < ApplicationController

  def new
    @player = Player.new

  end

  def create

    @player = Player.new(player_params)
    puts @player.first_name
    puts @player.id
    @player.team_id = applicable_team.id
    @player.save

    positions_params = params[:player][:positions]
    positions_params.delete("")
    positions_params.each do |index|
      position = Position.find(index.to_i)
      puts position.id
      PlayersPosition.create(player_id: @player.id, position_id: position.id)
    end



    @hitting_total = HittingTotal.new
    @hitting_total.set_initial_totals
    @hitting_total.player_id = @player.id
    @hitting_total.save

    if @player.positions.include?(Position.find(1))
      @pitching_total = PitchingTotal.new
      @pitching_total.set_initial_totals
      @pitching_total.player_id = @player.id
      @pitching_total.save
    end
    #
    #
    if @player.save
      flash[:notice] = "New Player Created!"
      redirect_to team_path(applicable_team.id)
    else
      flash[:error] = "Could Not Create a Player.  Try Again."
      redirect_to new_player_path
    end

  end

def show
  @player = Player.find(params[:id])

end



private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :birthdate, :bats, :throws)
  end



end
