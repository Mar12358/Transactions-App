class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Group, author: user
    can :manage, Entity, author: user

    return unless user.admin? # additional permissions for administrators

    can :manage, :all
  end
end
