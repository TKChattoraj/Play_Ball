class CreateGamePitchingStats < ActiveRecord::Migration[5.1]
  def change
    create_table :game_pitching_stats do |t|
      t.references :player
      t.references :game

      t.integer :full_innings
      t.integer :partial_innings
      t.integer :r
      t.integer :er
      t.integer :save
      t.integer :cg
      t.integer :bf
      t.integer :bb
      t.integer :h
      t.integer :single
      t.integer :double
      t.integer :tripple
      t.integer :hr
      t.integer :k
      t.integer :wp
      t.integer :hb
      t.integer :bk
      t.integer :sb


      t.timestamps null: false
    end
  end
end
