class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.restaurant.user =! user
  end

  def update?
    record.restaurant.user =! user
  end

  def show?
    record.restaurant.user =! user
  end

end
