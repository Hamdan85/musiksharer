require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do

  describe "GET #index" do
    it "assigns all artists as @artists" do
      artist = create(:artist)
      get :index
      expect(assigns(:artists)).to eq([artist])
    end
  end

end
