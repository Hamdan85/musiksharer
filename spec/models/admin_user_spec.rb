require 'rails_helper'

RSpec.describe AdminUser, type: :model do

  context :email do
    it 'must be present' do
      expect(build(:admin_user, email: nil)).to be_invalid
    end

    it 'must be unique' do
      create(:admin_user, email: 'admin@musiksearch.com')
      expect(build(:admin_user, email: 'admin@musiksearch.com')).to be_invalid
    end
  end

end
