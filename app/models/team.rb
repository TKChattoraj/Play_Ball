class Team < ActiveRecord::Base
  has_many :rosters
  has_many :users, :through => :rosters
end
