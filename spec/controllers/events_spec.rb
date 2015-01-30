require "rails_helper"

RSpec.describe EventsController, :type => :controller do
  describe "GET #index" do
    xit "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    xit "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end
end