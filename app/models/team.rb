class Team < ActiveRecord::Base
  has_many :rosters
  has_many :users, :through => :rosters
  has_many :notes
  has_many :players

  has_many :home_teams, class_name: :Game, foreign_key: :home_id
  has_many :visitor_teams, class_name: :Game, foreign_key: :visitors_id
  has_many :winners, class_name: :Game, foreign_key: :winner_id
  has_many :losers, class_name: :Game, foreign_key: :loser_id


end
