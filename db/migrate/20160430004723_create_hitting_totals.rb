class CreateHittingTotals < ActiveRecord::Migration
  def change
    create_table :hitting_totals do |t|
        t.integer :g
        t.integer :pa
        t.integer :ab
        t.integer :h
        t.integer :bb
        t.integer :b1
        t.integer :b2
        t.integer :b3
        t.integer :hr
        t.integer :k
        t.integer :sf
        t.integer :sb
        t.integer :err
        t.integer :hb
        t.integer :rbi
        t.integer :r
        t.integer :sb
        t.integer :cs

        t.decimal :ave
        t.decimal :obp
        t.decimal :slg

        t.references :player, index: true

      t.timestamps null: false
    end
  end
end


#(hitting totals: ave, h, ab, rbi, r g, pa, bb, 1b, 2b, 3b, hr, k sf, sb, err, hb, sb, cs, slg, ob% **
