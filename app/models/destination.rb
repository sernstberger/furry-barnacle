class Destination < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
