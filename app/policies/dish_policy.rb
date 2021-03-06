class DishPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    owns_restaurant?
  end

  def update?
    owns_restaurant?
  end

  def destroy?
    owns_restaurant?
  end

  private
  def owns_restaurant?
    record.menu.restaurant.user == user
  end

end
