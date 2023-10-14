require "rails_helper"

RSpec.describe User, type: :model do

  describe "relationships" do 
    it { should have_many :lures }
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
  end
end