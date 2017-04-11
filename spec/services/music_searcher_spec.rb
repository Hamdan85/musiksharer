require 'rails_helper'
require 'music_searcher'

RSpec.describe MusicSearcher do
  query = 'Dream Theater'

  context "must search on spotify for unknown music" do

    it "must create the artist" do
      expect{ MusicSearcher.new(query) }.to change(Artist, :count).from(0)
    end

    it "must create the album" do
      expect{ MusicSearcher.new(query) }.to change(Album, :count).from(0)
    end

    it "must create the track" do
      expect{ MusicSearcher.new(query) }.to change(Track, :count).from(0)
    end
  end
end