require 'rails_helper'

RSpec.describe Album, type: :model do

  let(:artist) { create(:artist) }


  it "must be associated to an artist" do
    expect(build(:album, artist: nil)).to be_invalid
  end

  it "must have a name" do
    expect(build(:album, artist: artist, name: nil)).to be_invalid
  end
end
