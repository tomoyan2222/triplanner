class CreateAreaMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :area_movies do |t|
      t.integer :region_num
      t.text :code

      t.timestamps
    end
  end
end
