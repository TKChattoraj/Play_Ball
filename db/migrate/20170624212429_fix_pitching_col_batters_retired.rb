class FixPitchingColBattersRetired < ActiveRecord::Migration[5.1]
  def change
    add_column :pitching_totals, :batters_retired, :integer
  end
end
