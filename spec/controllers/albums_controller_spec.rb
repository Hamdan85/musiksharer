require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  describe "GET #index" do
    it "assigns all albums as @albums" do
      album = create(:album)
      get :index, params: { artist_id: album.artist.friendly_id }
      expect(assigns(:albums)).to eq([album])
    end
  end

  describe "GET #show" do
    it "assigns the requested album as @album" do
      album = create(:album)
      get :show, params: { artist_id: album.artist.friendly_id, id: album.id }
      expect(assigns(:album)).to eq(album)
    end
  end

end
