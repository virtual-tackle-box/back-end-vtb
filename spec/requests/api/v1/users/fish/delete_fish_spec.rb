require "rails_helper"

RSpec.describe "Fish", type: :request do
  describe "DELETE /api/v1/users/:user_id/fish/:id" do
    it "can delete a fish w/ valid params" do
      user = create(:user)
      fish = user.fish.create(species: "Walleye", weight: 1.1, length: 12.1)

      headers = { "CONTENT_TYPE" => "application/json" }
      delete "/api/v1/users/#{user.id}/fish/#{fish.id}", headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect{ Fish.find(fish.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end