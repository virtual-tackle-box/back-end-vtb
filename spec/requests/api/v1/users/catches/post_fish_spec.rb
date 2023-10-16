require "rails_helper"

RSpec.describe "Fish", type: :request do
  describe "POST /api/v1/users/:user_id/fish" do
    it "can create a fish w/ valid params" do
      user = create(:user)

      fish_params = {
        "fish": {
          "species": "Pike",
          "weight": 4.5,
          "length": 29.1
        }
      }

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/users/#{user.id}/fish", headers: headers, params: JSON.generate(fish_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      new_fish = Fish.last
      fish_data = JSON.parse(response.body, symbolize_names: true)

      expect(fish_data).to be_a(Hash)
      expect(fish_data).to have_key(:data)
      expect(fish_data[:data].keys).to eq([:id, :type, :attributes])
      expect(fish_data[:data][:id]).to eq(new_fish.id.to_s)
      expect(fish_data[:data][:type]).to be_a(String)
      expect(fish_data[:data][:attributes].keys).to eq([:species, :weight, :length])
      expect(fish_data[:data][:attributes][:species]).to eq(new_fish.species)
      expect(fish_data[:data][:attributes][:weight]).to eq(new_fish.weight)
      expect(fish_data[:data][:attributes][:length]).to eq(new_fish.length)
    end

    it "cant create a fish w/invalid params" do
      user = create(:user)

      fish_params = {
        "fish": {
          "species": "",
          "weight": "",
          "length": 29.1
        }
      }

      headers = { "CONTENT_TYPE" => "application/json" } 
      post "/api/v1/users/#{user.id}/fish", headers: headers, params: JSON.generate(fish_params)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      error_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(error_data).to be_a(Hash)
      expect(error_data).to have_key(:error)
      expect(error_data[:error]).to eq("Validation failed: Species can't be blank, Weight can't be blank")
    end
  end
end