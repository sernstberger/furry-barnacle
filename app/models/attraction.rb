class Attraction < ApplicationRecord

  include Authority::Abilities

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  belongs_to :destination
  has_and_belongs_to_many :planners
end
