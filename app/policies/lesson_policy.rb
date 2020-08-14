class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.has_role?(:admin) || edit?
  end

  def edit?
    record.course.user_id == user.id
  end

  def update?
    edit?
  end

  def new?
    #user.has_role?(:teacher)
  end

  def create?
    #new?
  end

  def destroy?
    edit?
  end
end