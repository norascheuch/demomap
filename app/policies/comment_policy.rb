class CommentPolicy < ApplicationPolicy
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
    return true
  end

  def create?
    return new?
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  def destroy?
    return record.user == user
  end
end
