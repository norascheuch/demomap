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
    return Permission.where(demo: record.demo, user: user, role: 'admin').present?
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
