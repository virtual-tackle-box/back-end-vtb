require "rails_helper"

RSpec.describe "Catches", type: :request do
  describe "POST /api/v1/users/:user_id/catches" do
    it "can create a catch with valid params" do
      user = create(:user)

      catch_params = {
        "catch": {
          "species": "Pike",
          "weight": 4.5,
          "length": 29.1,
          "spot_name": "Lake D",
          "latitude": 38.9072,
          "longitude": -77.0370,
          "lure": "Topwater",
          "photo_url": "https://example.com/photo4.jpg"
        }
      }

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/users/#{user.id}/catches", headers: headers, params: JSON.generate(catch_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      new_catch = Catch.last
      catch_data = JSON.parse(response.body, symbolize_names: true)

      expect(catch_data).to be_a(Hash)
      expect(catch_data).to have_key(:data)
      expect(catch_data[:data].keys).to eq([:id, :type, :attributes])
      expect(catch_data[:data][:id]).to eq(new_catch.id.to_s)
      expect(catch_data[:data][:type]).to be_a(String)
      expect(catch_data[:data][:attributes].keys).to eq([:species, :weight, :length, :spot_name, :latitude, :longitude, :lure, :photo_url])
      expect(catch_data[:data][:attributes][:species]).to eq(new_catch.species)
      expect(catch_data[:data][:attributes][:weight]).to eq(new_catch.weight)
      expect(catch_data[:data][:attributes][:length]).to eq(new_catch.length)
      expect(catch_data[:data][:attributes][:spot_name]).to eq(new_catch.spot_name)
      expect(catch_data[:data][:attributes][:latitude]).to eq(new_catch.latitude)
      expect(catch_data[:data][:attributes][:longitude]).to eq(new_catch.longitude)
      expect(catch_data[:data][:attributes][:lure]).to eq(new_catch.lure)
      expect(catch_data[:data][:attributes][:photo_url]).to eq(new_catch.photo_url)
    end

    it "can't create a catch with invalid params" do
      user = create(:user)

      catch_params = {
        "catch": {
          "species": "",
          "weight": "",
          "length": 29.1,
          "spot_name": "Lake D",
          "latitude": 38.9072,
          "longitude": -77.0370,
          "lure": "Topwater",
          "photo_url": "https://example.com/photo4.jpg"
        }
      }

      headers = { "CONTENT_TYPE" => "application/json" } 
      post "/api/v1/users/#{user.id}/catches", headers: headers, params: JSON.generate(catch_params)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      error_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(error_data).to be_a(Hash)
      expect(error_data).to have_key(:error)
      expect(error_data[:error]).to include("Validation failed: Species can't be blank, Weight can't be blank")
    end
  end
end


# require "rails_helper"

# RSpec.describe "Fish", type: :request do
#   describe "POST /api/v1/users/:user_id/fish" do
#     it "can create a fish w/ valid params" do
#       user = create(:user)

#       fish_params = {
#         "fish": {
#           "species": "Pike",
#           "weight": 4.5,
#           "length": 29.1
#         }
#       }

#       headers = { "CONTENT_TYPE" => "application/json" }
#       post "/api/v1/users/#{user.id}/fish", headers: headers, params: JSON.generate(fish_params)

#       expect(response).to be_successful
#       expect(response.status).to eq(201)

#       new_fish = Fish.last
#       fish_data = JSON.parse(response.body, symbolize_names: true)

#       expect(fish_data).to be_a(Hash)
#       expect(fish_data).to have_key(:data)
#       expect(fish_data[:data].keys).to eq([:id, :type, :attributes])
#       expect(fish_data[:data][:id]).to eq(new_fish.id.to_s)
#       expect(fish_data[:data][:type]).to be_a(String)
#       expect(fish_data[:data][:attributes].keys).to eq([:species, :weight, :length])
#       expect(fish_data[:data][:attributes][:species]).to eq(new_fish.species)
#       expect(fish_data[:data][:attributes][:weight]).to eq(new_fish.weight)
#       expect(fish_data[:data][:attributes][:length]).to eq(new_fish.length)
#     end

#     it "cant create a fish w/invalid params" do
#       user = create(:user)

#       fish_params = {
#         "fish": {
#           "species": "",
#           "weight": "",
#           "length": 29.1
#         }
#       }

#       headers = { "CONTENT_TYPE" => "application/json" } 
#       post "/api/v1/users/#{user.id}/fish", headers: headers, params: JSON.generate(fish_params)
      
#       expect(response).to_not be_successful
#       expect(response.status).to eq(422)

#       error_data = JSON.parse(response.body, symbolize_names: true)
      
#       expect(error_data).to be_a(Hash)
#       expect(error_data).to have_key(:error)
#       expect(error_data[:error]).to eq("Validation failed: Species can't be blank, Weight can't be blank")
#     end
#   end
# end