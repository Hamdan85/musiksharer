class UsersTrack < ApplicationRecord
  belongs_to :user
  belongs_to :track

  validates_presence_of :user
  validates_presence_of :track

end
