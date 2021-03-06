class UserAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user)
    user.admin
  end

  def self.updatable_by?(user)
    user.admin
  end

  def self.creatable_by?(user)
    user.admin
  end

  def self.deletable_by?(user)
    user.admin
  end
end
