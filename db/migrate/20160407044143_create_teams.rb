class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :wins
      t.integer :losses
      t.decimal :winning_percentage
      t.decimal :games_back

      t.timestamps null: false
    end
  end
end
