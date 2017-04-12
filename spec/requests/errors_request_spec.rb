require 'rails_helper'

RSpec.describe "errors", :type => :request do

  it "displays the 500 page" do
    get "/500"

    expect(response).to have_http_status(500)
  end

end