class DestinationAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user)
    user
  end

  def self.updatable_by?(user)
    user
  end

  def self.creatable_by?(user)
    user
  end

  def self.deletable_by?(user)
    user
  end

  # Class method: can this user at least sometimes create a Destination?
  # def self.creatable_by?(user)
  #   user.manager?
  # end

  # Instance method: can this user delete this particular destination?
  # def deletable_by?(user)
  #   resource.in_future? && user.manager? && resource.department == user.department
  # end
end

# undefined; calls `DestinationAuthorizer.default(:updatable, user)`
# DestinationAuthorizer.updatable_by?(user)
