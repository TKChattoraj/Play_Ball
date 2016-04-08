class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
      t.boolean :manager
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
