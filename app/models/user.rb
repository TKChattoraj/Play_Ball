class User < ActiveRecord::Base
  has_many :rosters
  has_many :teams, :through => :rosters
  has_many :notes

  before_save {self.email = email.downcase}

  validates :teams, presence: true
  validates :first_name, presence: true
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"

  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false}

  has_secure_password

  def current_team
    self.teams.order("created_at").last
  end



end
