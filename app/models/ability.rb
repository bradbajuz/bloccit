class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :member
      can :manage, Post, :user_id => user.id
      can :manage, Comment, :user_id => user.id
      can :create, Vote
    end

    if user.role? :moderator
      can :destroy, Post
      can :destroy, Comment
    end

    if user.role? :admin
      can :manage, :all
    end

    can :read, :all
  end
end
