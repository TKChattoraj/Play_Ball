class TeamsController < ApplicationController

def show
  @team = Team.find(params[:id])
  @notes = @team.notes.recent
  @players = Player.on_team(@team)

end

end
