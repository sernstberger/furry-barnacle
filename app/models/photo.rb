class Photo < ApplicationRecord

  include Authority::Abilities

  mount_uploader :image, ImageUploader

  has_and_belongs_to_many :destinations
end
