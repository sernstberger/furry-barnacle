class Attraction < ApplicationRecord

  include Authority::Abilities

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  belongs_to :destination

  has_many :stops
  has_many :planners, through: :stops
end
