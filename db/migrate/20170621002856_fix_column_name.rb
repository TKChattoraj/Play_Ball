class FixColumnName < ActiveRecord::Migration[5.1]
    def change
      rename_column :game_pitching_stats, :save, :sv
    end
end
