class Album < ApplicationRecord

  extend FriendlyId

  belongs_to :artist

  has_many :tracks

  validates :name,
            presence: true,
            uniqueness: true

  validates :cover_url,
            presence: true

  validates_presence_of :artist
  validates_associated :artist

  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
        [:id, :name]
    ]
  end

end
