class MenuPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # Can only create menus for your own restaurant
    owns_restaurant?
  end

  def update?
    owns_restaurant?
  end

  def show?
    owns_restaurant?
  end

  private

  def owns_restaurant?
    record.restaurant.user == user
  end
end
