class Player < ActiveRecord::Base
  belongs_to :team
  has_one :hitting_total
  has_one :pitching_total
  has_and_belongs_to_many :positions

  has_many :game_hitting_stats
  has_many :game_pitching_stats



  enum bats: [:bats_left, :bats_right, :switch_hitter]
  # will allow player.bats = 'bats_left'
  # player.bats_left? #=> true
  enum throws: [:throws_left, :throws_right]


  def self.on_team(team)
    where("team_id =?", team)
  end

  def pitcher?
    self.positions.include?(Position.find_by(id: 1))
  end

end
