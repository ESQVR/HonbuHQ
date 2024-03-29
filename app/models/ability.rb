# frozen_string_literal: true

class Ability # rubocop:disable Style/Documentation
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # Omitted because mandatory authentication

    if user.admin?
      can :manage, Project
      can :manage, UserProject # Assuming you have a join model for users and projects
    else
      can :read, Project
      can :read, UserProject
      # Add more specific permissions as needed
    end
    #
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
