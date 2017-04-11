require 'rails_helper'

RSpec.describe Track, type: :model do
  let(:artist) { create(:artist) }
  let(:album) { create(:album, artist: artist) }

  it "must have a name" do
    expect(build(:track, name: nil)).to be_invalid
  end

  it "must be associated with an album and an artist" do
    expect(build(:track, album: nil)).to be_invalid
    expect(build(:track, album: album)).to respond_to(:artist)
  end

end
