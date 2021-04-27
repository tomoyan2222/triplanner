class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.integer :area_num
      t.string :thumbnail

      t.timestamps
    end
  end
end
