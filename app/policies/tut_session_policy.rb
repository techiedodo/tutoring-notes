class TutSessionPolicy < ApplicationPolicy
  def index?
    true
  end

  def edit?
    update?
  end

  def update?
    user.present?
  end
end
