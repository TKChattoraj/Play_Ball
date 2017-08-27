class AddCaughtStealingStatToGamePitching < ActiveRecord::Migration[5.1]
  def change
    add_column :game_pitching_stats, :cs, :integer
  end
end
