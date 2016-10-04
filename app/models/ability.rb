class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:create, :destroy], Request
      can [:create, :update, :destroy], Review, user_id: user.id
      can [:create, :destroy], Comment, user_id: user.id
      can [:create, :update, :destroy], BookStatus, user_id: user.id
    end
  end
end
