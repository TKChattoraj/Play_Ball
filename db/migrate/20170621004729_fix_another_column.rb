class FixAnotherColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :game_pitching_stats, :tripple, :triple
  end
end
