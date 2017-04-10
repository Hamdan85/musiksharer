class Artist < ApplicationRecord

  searchkick

  has_many :albums
  has_many :tracks, through: :albums

  validates :name,
            presence: true,
            uniqueness: true

end
