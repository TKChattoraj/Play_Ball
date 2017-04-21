class Team < ActiveRecord::Base
  has_many :rosters
  has_many :users, :through => :rosters
  has_many :notes
  has_many :players

  has_many :home_teams, class_name: :Game, foreign_key: :home_id
  has_many :visitor_teams, class_name: :Game, foreign_key: :visitors_id
  has_many :winners, class_name: :Game, foreign_key: :winner_id
  has_many :losers, class_name: :Game, foreign_key: :loser_id



  def determine_pct
    games = []

    Game.where(visitors: self.id).find_each do |g|
      games << g
    end
    Game.where(home: self.id).find_each do |g|
      games << g
    end

    puts "******************* Team's game count:************"
    puts games.count
    games.each do |g|
      puts g.id
    end

  end

end
