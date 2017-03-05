class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name

      t.timestamps null: false
    end

    change_table :players do |t|
      t.remove :positions
    end
  end
end
