class StudentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(tutor_id: user)
    end
  end
  def index?
    true
  end
end
