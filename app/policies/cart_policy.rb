class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def add?
    record.restaurant.user != user
  end

  def remove?
    record.restaurant.user != user
  end

  def empty?
    record.restaurant.user != user
  end

  def total?
    record.restaurant.user != user
  end

  def create?
    record.restaurant.user != user
  end

  def edit?
    record.restaurant.user != user
  end

  def update?
    record.restaurant.user != user
  end
end
