class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.belongs_to :album, foreign_key: true
      t.integer :duration
      t.string :isrc
      t.string :name
      t.string :audio_preview

      t.timestamps
    end
  end
end
