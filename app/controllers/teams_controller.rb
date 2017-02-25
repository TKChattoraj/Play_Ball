class TeamsController < ApplicationController

def show
  @team = Team.find(params[:id])
  @notes = @team.notes.recent
  @players = Player.get_team
end

end
