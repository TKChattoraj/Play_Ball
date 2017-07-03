class FixPitchingColBattersRetired < ActiveRecord::Migration
  def change
    add_column :pitching_totals, :batters_retired, :integer
  end
end
