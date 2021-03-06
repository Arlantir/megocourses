class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    user.has_role?(:admin) || record.user_id == user.id
  end

  def update?
    edit?
  end

  def new?
    user.has_role?(:teacher)
  end

  def create?
    new?
  end

  def destroy?
    edit?
  end
end
