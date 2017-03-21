class Photo < ApplicationRecord

  include Authority::Abilities

  has_and_belongs_to_many :destinations

  mount_uploader :image, ImageUploader

  before_create :default_name

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end
end
