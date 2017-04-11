require 'rails_helper'

RSpec.describe User, type: :model do
  context :email do
    it 'must be present' do
      expect(build(:user, email: nil)).to be_invalid
    end

    it 'must be unique' do
      create(:user, email: 'admin@musiksearch.com')
      expect(build(:user, email: 'admin@musiksearch.com')).to be_invalid
    end
  end

  context :add_and_remove_favorite_tracks do

    let(:track) { create(:track) }
    let(:user) { create(:user) }

    it 'must have a method to toggle favorite track' do
      expect(create(:user)).to respond_to(:toggle_favorite_track)
    end

    it 'must must add and remove a favorite track' do
      expect{ user.toggle_favorite_track(track) }.to change{ user.tracks.count }.from(0).to(1)
      expect{ user.toggle_favorite_track(track) }.to change{ user.tracks.count }.from(1).to(0)
    end
  end
end
