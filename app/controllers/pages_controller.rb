class PagesController < ApplicationController
  def index
    @page = params[:page] || 1

    @new_songs = Track.where(created_at: new_period).limit(12).reverse
    @top_songs = Track.where(created_at: new_period).limit(10)

    @query = params[:query] || '*'

    @tracks = MusicSearcher.search(@query).results.records.page(@page).per(1)
  end

  def profile
    @user = User.find(params[:id]) || current_user
  end

  private

  def new_period
    (Date.today.at_beginning_of_day - 1.week)..Time.now
  end
end
