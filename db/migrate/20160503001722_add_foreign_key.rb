class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    change_table :players do |t|
      t.belongs_to :team, index: true
    end
  end
end
