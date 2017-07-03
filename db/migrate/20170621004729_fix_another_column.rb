class FixAnotherColumn < ActiveRecord::Migration
  def change
    rename_column :game_pitching_stats, :tripple, :triple
  end
end
