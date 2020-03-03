class DemoPolicy < ApplicationPolicy
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
    return user.organizer
  end

  def create?
    return new?
  end

  def edit?
    return user.organizer && record.user == user
  end

  def update?
    return edit?
  end

  def destroy?
    return edit?
  end
end
