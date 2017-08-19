class Alert < ApplicationRecord
  belongs_to :user

  def self.active
    days_ago = 1
    time_ago = days_ago.days.ago.getlocal
    where("created_at > ?", time_ago)
  end

end
