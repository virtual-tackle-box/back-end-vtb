class Catch < ApplicationRecord
  validates :species, presence: true
  # validates :weight, presence: true
  # validates :length, presence: true
  validates :spot_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  # validates :lure, presence: true
  
  belongs_to :user
  
  has_many_attached :catch_images, dependent: :destroy
end