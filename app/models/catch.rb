class Catch < ApplicationRecord
  validates :species, presence: true
  validates :spot_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  
  belongs_to :user
end