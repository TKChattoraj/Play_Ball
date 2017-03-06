class CreateGameHittingStats < ActiveRecord::Migration
  def change
    create_table :game_hitting_stats do |t|
      t.references :player
      t.references :game

      t.integer :ab
      t.integer :pa
      t.integer :single
      t.integer :double
      t.integer :tripple
      t.integer :hr
      t.integer :bb
      t.integer :error
      t.integer :fc
      t.integer :hb
      t.integer :fc
      t.integer :wp
      t.integer :pb
      t.integer :sb
      t.integer :rbi
      t.integer :r
      t.integer :earned_run
      t.integer :sac
      t.integer :k
      
      t.timestamps null: false
    end
  end
end
