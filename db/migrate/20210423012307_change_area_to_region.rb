class ChangeAreaToRegion < ActiveRecord::Migration[6.0]
  def change
    rename_column :spots, :area_num, :region_num
  end
end
