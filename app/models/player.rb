class Player < ActiveRecord::Base
  belongs_to :team

  enum bats: [:bats_left, :bats_right]
  # will allow player.bats = 'bats_left'
  # player.bats_left? #=> true
  enum throws: [:throws_left, :throws_right]
end



# have many positions-P, C, 1b, 2b, 3b, SS, OF
# have one hitting totals-hitting totals belongs to player
# have one pitching totals-pitching totals belongs to player


#(hitting totals: ave, h, ab, rbi, r g, pa, bb, 1b, 2b, 3b, hr, k sf, sb, err, hb, sb, cs, slg, ob% **
#(pitching totals: w, l, era, ip, r, er, g, gs, cg, sv, bf, bb, h, 1b, 2b, 3b, hr, k, wp, hb, bk, sb, cs, pf)
