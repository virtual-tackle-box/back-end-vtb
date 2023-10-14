require "rails_helper"

RSpec.describe "Fish Index", type: :request do
  describe "GET /api/v1/users/:user_id/fish" do
    it "can get all fish for a user" do
      user = create(:user)
      
      fish_1 = user.fish.create(species: "Largemouth Bass", weight: 3.1, length: 13.4)
      fish_2 = user.fish.create(species: "Walleye", weight: 1.1, length: 12.1)
      fish_3 = user.fish.create(species: "Pike", weight: 4.5, length: 25.1)
      require 'pry'; binding.pry
      headers = { "CONTENT_TYPE" => "application/json" }
      get "/api/v1/users/#{user.id}/fish", headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      fish_data = JSON.parse(response.body, symbolize_names: true)

      expect(fish_data).to be_a(Hash)
      expect(fish_data).to have_key(:data)
      expect(fish_data[:data]).to be_a(Array)
      expect(fish_data[:data].count).to eq(3)
      expect(fish_data[:data][0]).to be_a(Hash)
      expect(fish_data[:data][0]).to have_key(:id)
      expect(fish_data[:data][0][:id]).to be_a(String)
      expect(fish_data[:data][0]).to have_key(:type)
      expect(fish_data[:data][0][:type]).to be_a(String)
      expect(fish_data[:data][0]).to have_key(:attributes)
      expect(fish_data[:data][0][:attributes]).to be_a(Hash)
      expect(fish_data[:data][0][:attributes]).to have_key(:species)
      expect(fish_data[:data][0][:attributes][:species]).to be_a(String)
      expect(fish_data[:data][0][:attributes]).to have_key(:weight)
      expect(fish_data[:data][0][:attributes][:weight]).to be_a(float)
      expect(fish_data[:data][0][:attributes]).to have_key(:length)
      expect(fish_data[:data][0][:attributes][:length]).to be_a(float)
    end
  end
end