class ChangeColumnNameGameHittingStat < ActiveRecord::Migration[5.1]
  def change
    rename_column :game_hitting_stats, :tripple, :triple
  end
end
