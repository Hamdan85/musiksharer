require 'rspotify'

class MusicSearcher
  attr_accessor :query

  attr_reader :spotify_results
  attr_reader :results
  attr_reader :artists
  attr_reader :albums
  attr_reader :tracks

  def self.search(query)
    new(query)
  end

  def initialize(query)
    @artists  = []
    @albums   = []
    @tracks   = []
    @query    = query

    assign_results

    if @results.empty?
      create_by_spotify
      assign_results
    end
  end

  private
  def assign_results
    @results = Track.query(@query)
  end

  def create_by_spotify
    @tracks = RSpotify::Track.search(@query)

    @tracks.each do |track|
      artist  = set_artist(track)
      album   = set_album(artist, track)
      track   = set_track(album, track)

      track
    end

    Track.query(@query)
  end

  def set_artist(track)
    artist = Artist.find_or_initialize_by(name: track.artists.first.name)
    artist.save
    artist
  end

  def set_album(artist, track)
    album = artist.albums.find_or_initialize_by(name: track.album.name)
    album.cover_url = track.album.images.first["url"]
    album.save

    album
  end

  def set_track(album, track)
    current_track = album.tracks.find_or_initialize_by(name: track.name)
    current_track.duration = (track.duration_ms / 1000).to_i
    current_track.isrc = track.external_ids["isrc"]
    current_track.audio_preview = track.preview_url

    current_track.save

    current_track
  end

end