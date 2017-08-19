class Note < ApplicationRecord
  belongs_to :user
  belongs_to :team


  def self.recent
    days_ago = 6
    time_ago = days_ago.days.ago.getlocal
    where("created_at > ?", time_ago)
  end
end
