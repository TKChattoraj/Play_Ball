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



end
