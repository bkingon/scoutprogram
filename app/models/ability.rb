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
        can :manage, ActivityResource

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
        can :manage, ActivityResource

      elsif user.has_role? :supreme_admin
        can :manage, :all
      elsif user.has_role? :group_admin
        can :update, Group do |g|
          allowed = false
          g.group_admins.each do |ga|
            allowed =  true if ga.user_id = user.id
          end
          allowed
        end
        can :read, :all
        can [:join_group], Group
        can [:leave_group], Group
        can [:create_admin], Group
        can :manage, :all
      else
        can :read, :all
        can [:join_group], Group
        can [:leave_group], Group
        can :create, Group
        can :manage, :all
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
