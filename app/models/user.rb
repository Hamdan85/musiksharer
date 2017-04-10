class User < ApplicationRecord
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_tracks
  has_many :tracks, through: :users_tracks

  validates :name,
            presence: true


  friendly_id :slug_candidates, use: :slugged


  def slug_candidates
    [
        [:id, :name]
    ]
  end
end
