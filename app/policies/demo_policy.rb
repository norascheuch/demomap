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
    # yes if current user has entry in permissions table
    return Permission.where(user: user, demo: record, role: 'admin').present?
  end

  def update?
    return edit?
  end

  def destroy?
    return record.user == user
  end
end
