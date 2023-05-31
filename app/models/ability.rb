class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Group, user_id: user.id
    can :manage, Entity, user_id: user.id

    return unless user.admin?

    can :manage, User
  end
end
