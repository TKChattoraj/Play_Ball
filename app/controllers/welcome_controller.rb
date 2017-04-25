class WelcomeController < ApplicationController
  def index
    @teams = Team.order(winning_percentage: :desc)
    Team.determine_games_back

  end

  def about
  end
end
