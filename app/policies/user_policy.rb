# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def edit?
    current_user?
  end

  def update?
    current_user?
  end

  def destroy?
    current_user?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  private

  def current_user?
    user&.id == record.id
  end
end
