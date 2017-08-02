class User < ActiveRecord::Base
  has_many :rosters
  has_many :teams, :through => :rosters
  has_many :notes

  before_save {self.email = email.downcase}

  before_save {self.cell = cell.gsub(/[^\d]/, "")}

  cell_REGEX = /\A(\d){3}\-(\d){3}\-(\d){4}\z/
  email_REGEX = /\A((\w)+(\.)?)*(\w)+@{1}((\w)+(\.)?)*(\w)+(\.){1}(com|io|org|biz)\z/i

  validates :first_name, presence: true
  validates :cell, presence: true, uniqueness: {case_sensitive: false}, format: {with: cell_REGEX}
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"

  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: email_REGEX}

  has_secure_password

  def current_team
    self.teams.order("created_at").last
  end

  def manager
    self.rosters.find_by(user_id: self.id, manager: true)

  end




end
