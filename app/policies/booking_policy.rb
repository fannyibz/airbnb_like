class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def confirm?
    record.flat.user == user
  end

  def unconfirm?
    record.flat.user == user
  end

end
