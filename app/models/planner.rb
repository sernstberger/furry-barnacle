class Planner < ApplicationRecord

  include Authority::Abilities

  belongs_to :user

  has_many :stops
  has_many :attractions, through: :stops
end
