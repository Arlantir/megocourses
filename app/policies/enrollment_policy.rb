class EnrollmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.has_role?(:admin)
  end

  def edit?
    record.user_id == user.id
  end

  def update?
    edit?
  end

  def destroy?
    index?
  end
end
