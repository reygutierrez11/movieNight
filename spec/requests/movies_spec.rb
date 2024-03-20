require 'rails_helper'

RSpec.describe "Movies", type: :request do
  # let(:movie) { { name:"That one movie", summary: "It's that one movie where the thing happens."} }
  let(:movie) { FactoryBot.create(:movie) }

  describe "GET /index" do
    it "shows a list of all the movies" do
      movie
      get movies_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response to the new page" do
      get new_movie_url
      expect(response).to be_successful
    end
  end
end
