class AddPositionsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :positions, :text
  end
end
