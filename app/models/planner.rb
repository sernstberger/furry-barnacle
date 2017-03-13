class Planner < ApplicationRecord

  include Authority::Abilities

  belongs_to :user
  has_and_belongs_to_many :planners
end
