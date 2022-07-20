class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.is? :admin
      can :manage, :all
    else
      can :manage, Post, user_id: user.id
      can :read, :all
    end
  end
end
