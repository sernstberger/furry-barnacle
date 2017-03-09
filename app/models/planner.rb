class Planner < ApplicationRecord

  include Authority::Abilities

  belongs_to :user
end
