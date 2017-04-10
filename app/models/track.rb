class Track < ApplicationRecord

  extend FriendlyId

  searchkick

  paginates_per 10

  belongs_to :album
  belongs_to :artist

  has_many :users_tracks
  has_many :users, through: :users_tracks

  validates :name,
            presence: true,
            uniqueness: true

  validates :audio_preview,
            presence: true

  validates_associated :album

  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
        [:id, :name]
    ]
  end

  def search_data
    {
        name: self.name,
        album: self.album.name,
        artist: self.album.artist.name
    }
  end

  def self.query(query, page = 1)
    if query.nil?
      page(page)
    else
      search(
          query,
          fields: %w(name^10 album artist),
          page: page,
          per_page: 10
      )
    end
  end

end
