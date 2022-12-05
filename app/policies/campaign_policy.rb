class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #No need for an index route for nested under charity, hav eit on their show page for better UX, idiot
      scope.all
      # scope.where(record.charity = @charity)
    end
  end

  def show? 
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
