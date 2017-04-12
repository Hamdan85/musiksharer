class Artist < ApplicationRecord

  extend FriendlyId

  has_many :albums
  has_many :tracks, through: :albums

  serialize :genres, Array

  validates :name,
            presence: true,
            uniqueness: true

  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
        [:id, :name]
    ]
  end



end
