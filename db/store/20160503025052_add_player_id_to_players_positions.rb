class AddPlayerIdToPlayersPositions < ActiveRecord::Migration[5.1]
  def change
    change_table :players_positions do |t|
      t.belongs_to :player, index: true
    end
  end
end
