class FixColumnName < ActiveRecord::Migration
    def change
      rename_column :game_pitching_stats, :save, :sv
    end
end
