class Game < ActiveRecord::Base
  belongs_to :home, class_name: :Team
  belongs_to :visitors, class_name: :Team

  has_many :game_hitting_stats
end
