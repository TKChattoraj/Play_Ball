class Alert < ApplicationRecord
  belongs_to :user

  def self.active
    # days_ago = 2
    # time_ago = days_ago.days.ago.getlocal

    minutes_ago = 10

    time_ago = minutes_ago.minutes.ago.getlocal
    where("created_at > ?", time_ago)
  end

end
