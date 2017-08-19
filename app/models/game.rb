class Game < ApplicationRecord
  belongs_to :home, class_name: :Team
  belongs_to :visitors, class_name: :Team

  belongs_to :winner, class_name: :Team
  belongs_to :loser, class_name: :Team

  has_many :game_hitting_stats
  has_many :game_pitching_stats

  def determine_winner_loser
    if (self.home_runs > self.visitor_runs)
      self.winner = self.home
      self.loser = self.visitors
    end
    if (self.visitor_runs > self.home_runs)
    self.winner = self.visitors
      self.loser = self.home
    end
    self.save
  end


end
