class CreatePitchingTotals < ActiveRecord::Migration[5.1]
  def change
    create_table :pitching_totals do |t|
      t.integer :w
      t.integer :l
      t.integer :ip
      t.integer :r
      t.integer :er
      t.integer :g
      t.integer :gs
      t.integer :sv
      t.integer :cg
      t.integer :bf
      t.integer :bb
      t.integer :h
      t.integer :b1
      t.integer :b2
      t.integer :b3
      t.integer :hr
      t.integer :k
      t.integer :wp
      t.integer :hb
      t.integer :bk
      t.integer :sb
      t.integer :cs

      t.decimal :era

      t.references :player, index: true

      t.timestamps null: false
    end
  end
end




#(pitching totals: w, l, era, ip, r, er, g, gs, cg, sv, bf, bb, h, 1b, 2b, 3b, hr, k, wp, hb, bk, sb, cs, pf)
