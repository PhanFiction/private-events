require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /index" do
    it "renders the index template" do
      get events_path
      expect(response).to render_template(:index)
    end
  end
end
