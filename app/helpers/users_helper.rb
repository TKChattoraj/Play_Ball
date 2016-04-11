module UsersHelper

  def current_team
    self.teams.order("created_at").last
  end

end
