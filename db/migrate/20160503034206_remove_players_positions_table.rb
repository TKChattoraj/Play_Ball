class RemovePlayersPositionsTable < ActiveRecord::Migration
  def change
    drop_table :players_positio
  end
end
