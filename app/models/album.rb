class Album < ApplicationRecord

  searchkick

  belongs_to :artist

  has_many :tracks

  validates :name,
            presence: true,
            uniqueness: true

  validates :cover_url,
            presence: true

end
