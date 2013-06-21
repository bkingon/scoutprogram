class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      # if user.has_role? :supreme_admin
        # can :manage, :all
      if user.has_role? :moderator

        can :read, AdminUser
        can :update, AdminUser do |u|
          (u.try(:email) == user.email)
        end

        can :read, ActiveAdmin::Page, :name => "Dashboard"
        can :manage, Activity
        can :manage, Tag

      elsif user.has_role? :admin

        can :read, AdminUser
        can :read, ActiveAdmin::Page, :name => "Dashboard"
        can :update, AdminUser do |u|
          (u.try(:email) == user.email) || (u.has_role? :moderator)
        end
        can :create, AdminUser

        can :read, ActiveAdmin::Page, :name => "Dashboard"
        can :manage, Activity
        can :manage, Tag

      elsif user.has_role? :supreme_admin
        can :manage, :all
      else
        can :read, :all
      end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
