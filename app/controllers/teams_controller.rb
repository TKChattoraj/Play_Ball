class TeamsController < ApplicationController

def show
  @team = Team.find(params[:id])
  @notes = @team.note.recent
end

end
