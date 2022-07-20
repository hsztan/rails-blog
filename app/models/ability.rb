class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.is? :admin
      can :manage, :all
    else
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
      can :read, :all
      can :add, Comment
      can [:update, :delete], Comment
    end
  end
end
