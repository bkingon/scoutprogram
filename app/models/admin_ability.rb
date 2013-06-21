# # All back end users (i.e. Active Admin users) are authorized using this class
# class AdminAbility
#   include CanCan::Ability

#   def initialize(user)
#     user ||= User.new

#     # We operate with three role levels:
#     #  - Editor
#     #  - Moderator
#     #  - Manager

#     # An editor can do the following:
#     # can :manage, :all
#     # can :read, :all

#     # A moderator can do the following:
#     # if user.has_role? :supreme_admin
#     #   can :manage, :all
#     # end
#     # if user.has_role? :admin
#     #   can :read, :all
#     #   # can :update, AdminUser, id: user.id
#     #   can :update, AdminUser do |u|
#     #     u.try(:email) == user.email
#     #   end
#     # else
#     #   can :read, :all
#     # end

#     # A manager can do the following:
#     # if user.role?('manager')
#       # can :manage, SomeThirdModel
#     # end
#   end
# end
