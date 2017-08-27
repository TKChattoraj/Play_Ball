module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def standings
    Team.all.each do |t|
      t.determine_wins_loss_pct
    end

    @teams = Team.order(winning_percentage: :desc)

    Team.determine_games_back
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def show_alerts?
    if Alert.active.any?
      puts 'alerts active'
      display = 'block'
    else
      display = 'none'
      puts 'no active alerts'
    end
    display
  end

  def determine_alertBox_view
    if Alert.active.any?
      'display-alerts'
    else
      'do-not-display-alerts'
    end
  end


end
