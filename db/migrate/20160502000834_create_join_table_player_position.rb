class CreateJoinTablePlayerPosition < ActiveRecord::Migration[5.1]
  def change
    create_join_table :players, :positions do |t|
      t.index :player_id
      t.index :position_id
    end

  end
end
