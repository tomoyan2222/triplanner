class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :url
      t.references :spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
