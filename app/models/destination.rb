class Destination < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :attractions
  has_and_belongs_to_many :photos
end
