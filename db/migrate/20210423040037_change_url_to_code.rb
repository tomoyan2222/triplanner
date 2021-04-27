class ChangeUrlToCode < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :url, :code
  end
end
