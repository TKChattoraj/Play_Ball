class Team < ApplicationRecord
  has_many :rosters
  has_many :users, :through => :rosters
  has_many :notes
  has_many :players

  has_many :home_teams, class_name: :Game, foreign_key: :home_id
  has_many :visitor_teams, class_name: :Game, foreign_key: :visitors_id
  has_many :winners, class_name: :Game, foreign_key: :winner_id
  has_many :losers, class_name: :Game, foreign_key: :loser_id



  def determine_wins_loss_pct
    games = []

    Game.where(visitors: self.id).find_each do |g|
      games << g
    end
    Game.where(home: self.id).find_each do |g|
      games << g
    end
    wins = 0
    losses = 0
    games.each do |g|
      if g.winner_id == self.id
        wins += 1
      end
      if g.loser_id == self.id
        losses += 1
      end
    end
    self.wins = wins
    self.losses = losses
    self.winning_percentage = self.wins.fdiv(self.wins + self.losses)
    self.save

  end

  




  def self.determine_games_back
    teams = Team.order(winning_percentage: :desc)
    first_place = teams[0]
    teams.each do |t|
      games_back = ((first_place.wins - t.wins).abs + (t.losses - first_place.losses).abs).fdiv(2).round(1)
      t.games_back = games_back
      t.save
    end

  end

end
