class DropTableThumbnail < ActiveRecord::Migration[6.0]
  def up
    drop_table :thumbnails
  end

  def down
    create_table :thumbnails do |t|
      t.string :file_name
      t.references :spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
