class Catch < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  
  validates :species, presence: true
  validates :weight, presence: true
  validates :length, presence: true
  validates :spot_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :lure, presence: true
end