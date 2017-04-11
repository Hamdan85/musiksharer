class PagesController < ApplicationController
  def index
    @page = params[:page] || 1

    @new_songs = Track.where(created_at: new_period).limit(12).reverse
    @top_songs = Track.top_rated.limit(10)

    @query = params[:query] || '*'

    @tracks = MusicSearcher.search(@query).results.records.page(@page).per(12)
  end

  def profile
    @user = User.friendly.find(params[:id]) || current_user
  end

  def add_favorite
    @track = Track.friendly.find(params[:track_id])

    current_user.toggle_favorite_track(@track)
  end

  private

  def new_period
    (Date.today.at_beginning_of_day - 1.week)..Time.now
  end
end
