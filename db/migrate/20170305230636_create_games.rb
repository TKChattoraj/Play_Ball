class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :home
      t.references :visitors
      t.references :winner
      t.references :loser
      t.references :location
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
  end
end
