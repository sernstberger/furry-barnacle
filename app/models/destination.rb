class Destination < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :attractions
end
