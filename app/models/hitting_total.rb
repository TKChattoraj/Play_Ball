class HittingTotal < ApplicationRecord
  belongs_to :player

  def set_initial_totals
    self.g = 0
    self.pa = 0
    self.ab = 0
    self.h = 0
    self.bb = 0
    self.b1 = 0
    self.b2 = 0
    self.b3 = 0
    self.hr = 0
    self.k =  0
    self.sf = 0
    self.err = 0
    self.hb = 0
    self.rbi = 0
    self.r = 0
    self.sb = 0
    self.cs = 0
    self.ave = 0.000
    self.obp = 0.000
    self.slg = 0.000
  end
end
