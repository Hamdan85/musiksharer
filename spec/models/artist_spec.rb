require 'rails_helper'

RSpec.describe Artist, type: :model do
  it "must have a name" do
    expect(build(:artist, name: nil)).to be_invalid
  end
end
