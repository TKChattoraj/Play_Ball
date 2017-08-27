class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true

      t.timestamps null: false
    end
  end
end
