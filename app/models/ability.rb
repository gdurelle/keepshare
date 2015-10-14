class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    case user.role
    when 'admin'
      can :crud, :all
    when 'user'
      can :read, [List, Item]
      can :create, List
      can [:update, :destroy], List, user_id: user.id

      can :create, Item, list: { user_id: user.id }
      can [:update, :destroy], Item, list: { user_id: user.id }
    when 'guest'
      can :read, [List, Item]
    end
  end
end
