class CreateUsersTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :users_tracks do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :track, foreign_key: true

      t.timestamps
    end
  end
end
