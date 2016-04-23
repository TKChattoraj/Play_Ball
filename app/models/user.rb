class User < ActiveRecord::Base
  has_many :rosters
  has_many :teams, :through => :rosters
  has_many :notes

  before_save {self.email = email.downcase}
  before_save {self.cell = cell.delete '-'}

  cell_REGEX = /\A(\d){10}\s/

  validates :first_name, presence: true
  validates :cell, presence: true, uniqueness: {case_sensitive: false}, format: {with: cell_REGEX}
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"

  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false}

  has_secure_password

  def current_team
    self.teams.order("created_at").last
  end



end
