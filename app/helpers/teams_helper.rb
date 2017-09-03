module TeamsHelper

  def applicable_team
    if current_user
      current_user.teams.order("created_at").last
    else
      false
    end
  end

end
