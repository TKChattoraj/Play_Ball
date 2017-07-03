class PitchingTotal < ActiveRecord::Base
  belongs_to :player


  def set_initial_totals

    self.w = 0
    self.l = 0
    self.ip = 0
    self.r = 0
    self.er = 0
    self.g = 0
    self.gs = 0
    self.cg = 0
    self.sv = 0
    self.bf = 0
    self.bb = 0
    self.h = 0
    self.b1 = 0
    self.b2 = 0
    self.b3 = 0
    self.hr = 0
    self.k = 0
    self.wp = 0
    self.hb = 0
    self.bk = 0
    self.sb = 0
    self.cs = 0

    self.era = 0.000

  end
end
