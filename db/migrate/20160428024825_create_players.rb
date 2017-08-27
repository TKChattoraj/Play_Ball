class CreatePlayers < ActiveRecord::Migration[5.1.3]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :bats
      t.integer :throws
      t.timestamps null: false
    end
  end
end
