# frozen_string_literal: true

class Ability
  include CanCan::Ability

def initialize(user)
    user ||= User.new

    can :manage, Group, user_id: user.id
    can :manage, Entity, user_id: user.id

    if user.admin? 
      can :manage, User
    end
  end
end