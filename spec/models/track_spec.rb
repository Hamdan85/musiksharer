require 'rails_helper'

RSpec.describe Track, type: :model do
  let(:user) { create(:user)}
  let(:artist) { create(:artist) }
  let(:album) { create(:album, artist: artist) }
  let(:track) { create(:track) }

  it "must have a name" do
    expect(build(:track, name: nil)).to be_invalid
  end

  it "must be associated with an album and an artist" do
    expect(build(:track, album: nil)).to be_invalid
    expect(build(:track, album: album)).to respond_to(:artist)
  end

  it "must have a method to count favorites" do
    expect(track).to respond_to(:favorite_count)
    expect{ user.toggle_favorite_track(track) }.to change{ track.favorite_count }.from(0).to(1)
  end

end
