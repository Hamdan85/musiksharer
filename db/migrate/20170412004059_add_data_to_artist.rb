class AddDataToArtist < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :photo, :string
    add_column :artists, :genres, :string
  end
end
