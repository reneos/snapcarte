class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.user == current.user
  end

  def delete?
    record.user == current.user
  end

end
