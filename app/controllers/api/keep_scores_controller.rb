class API::KeepScoresController < ApplicationController

  def get_teams
    teams = Team.all

    render json: teams, each_serializer: TeamSerializer
  end
end
