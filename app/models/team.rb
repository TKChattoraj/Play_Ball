class Team < ActiveRecord::Base
  has_many :rosters
  has_many :users, :through => :rosters
  has_many :notes
  has_many :players

end
