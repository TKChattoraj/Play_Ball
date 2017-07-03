class AddCaughtStealingStatToGamePitching < ActiveRecord::Migration
  def change
    add_column :game_pitching_stats, :cs, :integer
  end
end
