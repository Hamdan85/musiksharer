require 'rails_helper'

RSpec.describe UsersTrack, type: :model do

  it "must be associated with an user" do
    expect(build(:users_track, :invalid_user)).to be_invalid
  end

  it "must be associated with an user" do
    expect(build(:users_track, :invalid_track)).to be_invalid
  end
end
