class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.text :content
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
