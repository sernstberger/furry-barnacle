class Stop < ApplicationRecord
  belongs_to :attraction
  belongs_to :planner

  acts_as_list
end
