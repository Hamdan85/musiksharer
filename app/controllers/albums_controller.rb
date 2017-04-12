class AlbumsController < ApplicationController
  before_action :set_artists
  before_action :set_artist, only: [:index, :show]
  before_action :set_album, only: [:show]

  # GET /albums
  # GET /albums.json
  def index
    @albums = @artist.albums.all.page(params[:page] || 1).per(18)
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  private
  def set_artists
    @artists = Artist.all
  end

  def set_artist
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def set_album
    @album = @artist.albums.friendly.find(params[:id])
  end

end
