class Track < ApplicationRecord

  extend FriendlyId

  searchkick

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


end
