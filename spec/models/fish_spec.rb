require "rails_helper"

RSpec.describe Fish, type: :model do
  
  describe "relationships" do
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :species }
    it { should validate_presence_of :length }
    it { should validate_presence_of :weight }
  end
end