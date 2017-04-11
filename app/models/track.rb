class Track < ApplicationRecord

  extend FriendlyId

  searchkick

  belongs_to :album
  has_one :artist, through:  :album


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

  def self.query(query = nil)
    query = query || '*'
    search(
        query,
        fields: %w(name^10 album artist),
    )
  end

  def self.top_rated
    left_joins(:users_tracks)
        .group(:id)
        .order('COUNT(users_tracks.id) DESC')
  end

  def favorite_count
    users_tracks.count
  end
end
