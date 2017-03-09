class Post < ApplicationRecord

  include Authority::Abilities

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
end
