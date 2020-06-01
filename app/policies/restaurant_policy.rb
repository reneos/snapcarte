class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def show?
    true
  end

  def edit_menus?
    record.user == user
  end
end
