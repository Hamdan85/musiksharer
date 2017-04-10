class PagesController < ApplicationController
  def index
    @tracks = Track.all.order(:created_at).limit(8).reverse
    @new_songs = Track.where(created_at: new_period).limit(8)
    @top_songs = Track.where(created_at: new_period).limit(8)
  end

  def search
    @query = params[:query]

    @results = MusicSearcher.search(@query)
  end

  def profile
    @user = User.find(params[:id]) || current_user
  end

  private

  def new_period
    (Date.today.at_beginning_of_day - 1.week)..Time.now
  end
end
