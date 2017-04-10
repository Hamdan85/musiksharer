class PagesController < ApplicationController
  def index
  end

  def profile
    @user = User.find(params[:id]) || current_user
  end
end
