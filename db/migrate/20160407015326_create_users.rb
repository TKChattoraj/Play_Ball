class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cell
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
