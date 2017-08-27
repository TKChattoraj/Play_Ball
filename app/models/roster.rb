class Roster < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :team_id, presence: true
  validates :user_id, presence: true

  # after_save :set_other_rosters_to_false, if: :manager?
end
