class TutSessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(tutor_id: user)
    end
  end
end
