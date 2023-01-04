class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Inventory, public: true

    return unless user.present?
    can :manage, :all, user:user
  end
end
