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
end
