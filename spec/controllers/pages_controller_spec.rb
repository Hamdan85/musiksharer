require 'rails_helper'

RSpec.describe PagesController, type: :controller do


  context 'users' do
    login_user

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "should get index" do
      get 'index'
      expect(response).to be_success
    end

    let(:track) { create(:track) }

    it "must receive a request for adding a track to favorites" do

      post :add_favorite, params: { track_id: track.slug }, format: 'js'

      expect(response).to have_http_status(:ok)
      expect(response)
          .to render_template('add_favorite');

      post :add_favorite, params: { track_id: track.slug }, format: 'js'

      expect(response).to have_http_status(:ok)
      expect(response)
          .to render_template('add_favorite');
    end

  end

  context 'profiles' do
    let(:user) { create(:user)}

    it "should get profile" do
      get :profile, params: { id: user.friendly_id }

      expect(assigns(:user)).to eq(user)
      expect(response).to have_http_status(:ok)
    end
  end

end
