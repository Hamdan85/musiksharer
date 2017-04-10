class AddSlugToTables < ActiveRecord::Migration[5.0]
  AFFECTED_TABLES = [:albums, :artists, :tracks, :users]

  def change
    AFFECTED_TABLES.each do |tab|
      add_column tab, :slug, :string
      add_index tab, :slug, unique: true
    end
  end
end
