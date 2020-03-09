class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def new?
    record.demo.user == user
  end

  def create?
    return new?
  end

  def edit?
    return record.user == user
  end

  def update?
    return edit?
  end

  def destroy?
    return edit?
  end
end
