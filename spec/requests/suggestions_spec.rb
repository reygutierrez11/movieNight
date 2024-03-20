require 'rails_helper'

RSpec.describe "/suggestions", type: :request do
  # let(:weekly_suggestions) { SuggBox.new }
  # let(:valid_attributes) { { movie: 'Django', author: 'Ruben' , user: "Ruben@gmail.com", sugg_box_id: weekly_suggestions.id  } }
  let(:user) { FactoryBot.create(:user) }
  let(:movie) { FactoryBot.create(:movie) }
  let(:suggestion) { FactoryBot.create(:suggestion) }
  let(:all_time_minus_weekly) { create(:suggestion, sugg_box: create(:sugg_box, name: "All Encompassing")) }

  describe "GET /index" do
    it "shows a list of all the suggestions" do
      suggestion
      get suggestions_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a succesful response" do
      movie
      suggestion
      all_time_minus_weekly
      get new_suggestion_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a succesful response" do
      sign_in user
      get suggestion_url(suggestion)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a succeful response for the edit page" do
      get edit_suggestion_url(suggestion)
      expect(response).to be_successful
    end
  end
end
