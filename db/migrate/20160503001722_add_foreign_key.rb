class AddForeignKey < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.belongs_to :team, index: true
    end
  end
end
