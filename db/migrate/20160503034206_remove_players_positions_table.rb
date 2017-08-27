class RemovePlayersPositionsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :players_positions
  end
end
