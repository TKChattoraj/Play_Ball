class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :home_team, index: true
      t.references :visitor_team, index: true
      t.references :winner, index: true
      t.references :loser, index: true
      t.references :location, index: true
      t.integer :home_runs
      t.integer :home_hits
      t.integer :home_errors
      t.integer :visitor_runs
      t.integer :visitor_hits
      t.integer :visitor_errors
      t.date :date
      t.time :time

      t.timestamps null: false
    end

    add_foreign_key :games, :teams, column: :home_team_id
    add_foreign_key :games, :teams, column: :visitor_team_id
    add_foreign_key :games, :teams, column: :winner_id
    add_foreign_key :games, :teams, column: :loser_id
    add_foreign_key :games, :locations
  end
end
