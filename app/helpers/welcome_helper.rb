module WelcomeHelper

  def standings
    @teams = Team.order(winning_percentage: :desc)
    Team.determine_games_back
  end




end
