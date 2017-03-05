module TeamsHelper

  def applicable_team
    current_user.teams.order("created_at").last
  end

end
