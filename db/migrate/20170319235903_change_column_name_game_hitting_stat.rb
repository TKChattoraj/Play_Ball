class ChangeColumnNameGameHittingStat < ActiveRecord::Migration
  def change
    rename_column :game_hitting_stats, :tripple, :triple
  end
end
