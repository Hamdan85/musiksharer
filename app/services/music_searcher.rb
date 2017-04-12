require 'rspotify'
require 'assets/normalize_uri'

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
    else
      delay.create_by_spotify
    end
  end

  private
  def assign_results
    @results = Track.query(@query)
  end

  @tracks = []

  def create_by_spotify

    #RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])

    results = RSpotify::Base.search(@query, 'artist, track, album')

    results.sort_by(&:type).each do |result|

      case result.type
      when 'artist'
        set_artist(result) if result.type == 'artist'
      when 'album'
        set_album(result) if result.type == 'album'
      when 'track'
        set_track(result) if result.type == 'track'
      end
    end

    Track.query(@query)
  end

  def set_artist(artist)

    new_artist = Artist.find_or_initialize_by(name: artist.name)
    new_artist.photo = (!artist.respond_to?(:images) || artist.images.empty?) ? 'default-artist.png' : artist.images.first["url"]
    new_artist.genres = artist.genres
    new_artist.save

    delay.async_album_retrieval(artist.albums)
  end

  def set_album(album)
    artist = Artist.find_or_initialize_by(name: album.artists.first.name)

    set_artist(album.artists.first) if artist.new_record?

    new_album = artist.albums.find_or_initialize_by(name: album.name)
    new_album.cover_url = album.images.empty? ? 'default-artist.png' : album.images.first["url"]
    new_album.save

    delay.async_album_tracks_retrieval(album)

  end

  def set_track(track)
    album = Album.find_or_initialize_by(name: track.album.name)

    set_album(track.album) if album.new_record?

    new_track = album.tracks.find_or_initialize_by(name: track.name)
    new_track.duration = (track.duration_ms / 1000).to_i
    new_track.isrc = track.external_ids["isrc"]
    new_track.audio_preview = track.preview_url

    new_track.save
  end

  def async_album_retrieval(albums)
    albums.each do |album|
      delay.set_album(album)
      delay.async_album_tracks_retrieval(album)
    end
  end

  def async_album_tracks_retrieval(album)
    album.tracks.each do |track|
      delay.set_track(track)
    end
  end

end