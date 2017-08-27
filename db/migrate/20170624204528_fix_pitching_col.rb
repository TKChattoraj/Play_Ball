class FixPitchingCol < ActiveRecord::Migration[5.1]

    def change
      rename_column :game_pitching_stats, :full_innings, :batters_retired
      remove_column :game_pitching_stats, :partial_innings

    end

end
