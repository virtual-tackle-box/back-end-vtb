require "rails_helper"

RSpec.describe "Fish", type: :request do
  describe "PATCH /api/v1/users/:user_id/fish/:id" do
    it "can update a fish w/ valid params" do
      user = create(:user)
      fish = user.fish.create(species: "Largemouth Bass", weight: 4.4, length: 18.5)

      fish_params = {
        "fish": {
          "species": "Largemouth Bass",
          "weight": 4.4,
          "length": 18.5
        }
      }

      headers = { "CONTENT_TYPE" => "application/json" } 
      patch "/api/v1/users/#{user.id}/fish/#{fish.id}", headers: headers, params: JSON.generate(fish_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      updated_fish = Fish.find(fish.id)
      fish_data = JSON.parse(response.body, symbolize_names: true)

      expect(fish_data).to be_a(Hash)
      expect(fish_data).to have_key(:data)
      expect(fish_data[:data].keys).to eq([:id, :type, :attributes])
      expect(fish_data[:data][:id]).to eq(updated_fish.id.to_s)
      expect(fish_data[:data][:type]).to be_a(String)
      expect(fish_data[:data][:attributes].keys).to eq([:species, :weight, :length])
      expect(fish_data[:data][:attributes][:species]).to eq(updated_fish.species)
      expect(fish_data[:data][:attributes][:weight]).to eq(updated_fish.weight)
      expect(fish_data[:data][:attributes][:length]).to eq(updated_fish.length)
    end
  end
end