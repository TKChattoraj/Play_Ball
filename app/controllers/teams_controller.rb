class TeamsController < ApplicationController

def show
  @team = Team.find(params[:id])
  @notes = @team.notes.recent
end

end
