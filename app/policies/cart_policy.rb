class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def add_to?
    # record.restaurant.user != user
    true
  end

  def create?
    # record.restaurant.user != user
    true
  end

  def edit?
    record.restaurant.user != user
  end

  def update?
    # record.restaurant.user != user
    true
  end
end
