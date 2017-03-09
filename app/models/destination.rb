class Destination < ApplicationRecord
  include Authority::Abilities

  # self.authorizer_name = 'AdminAuthorizer'

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :attractions
  has_and_belongs_to_many :photos
end
