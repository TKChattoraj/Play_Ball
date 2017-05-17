class API::KeepScoresController < ApplicationController
  skip_before_action :verify_authenticity_token


  #
  #  Nd strong parameters
  #
  before_action :set_access_control_headers

    def set_access_control_headers

      headers['Access-Control-Allow-Origin'] = '*'

      headers['Access-Control-Alow-Methods'] = 'POST, GET, OPTIONS'

      headers['Access-Control-Allow-Headers'] = 'Content-Type'
    end

    def preflight

      head 200
    end

  def get_teams
    teams = Team.all


    render json: teams, each_serializer: TeamSerializer
  end

  def get_roster
    team_id = params[:id]
    team = Team.find(team_id)
    players = team.players

    render json: players, each_serializer: RosterSerializer
  end

end
