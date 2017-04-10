class Album < ApplicationRecord

  extend FriendlyId

  searchkick

  belongs_to :artist

  has_many :tracks

  validates :name,
            presence: true,
            uniqueness: true

  validates :cover_url,
            presence: true

  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
        [:id, :name]
    ]
  end

end
