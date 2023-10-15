class Fish < ApplicationRecord
  belongs_to :user

  validates :species, presence: true
  validates :length, presence: true
  validates :weight, presence: true
end