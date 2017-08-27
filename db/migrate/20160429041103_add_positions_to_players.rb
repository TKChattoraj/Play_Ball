class AddPositionsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :positions, :text
  end
end
