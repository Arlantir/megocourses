class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.has_role?(:admin) || edit? || record.course.bought(user) == false
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
    edit?
  end

  def destroy?
    edit?
  end
end