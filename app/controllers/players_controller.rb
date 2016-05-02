class PlayersController < ApplicationController

  def new
    @player = Player.new

  end

  def create

    @player = Player.new(player_params)

    @hitting_total = HittingTotal.new.set_initial_totals
    @hitting_total.player_id = @player.id

    # if @player.positions
    #
    # end
    #
    #
    #
    #
    #
    # if @player.save
    #
    # else
    #
    # end

  end




private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :birthdate, :bats, :throws, :positions)
  end



end
