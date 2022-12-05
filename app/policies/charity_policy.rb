class CharityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # record.user == user
      # record.user == 
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user # or CharityPolicy.new(user, User.find(charity.user_id)).edit?
  end
  # record: the restaurant passed to the `authorize` method in controller
  # user: the `current_user` signed in with Devise

  def destroy?
    record.user == user
  end
end
