class TeacherPolicy < ApplicationPolicy

  def index?
    user_is_staff?
  end

  def show?
    user_is_staff?
  end

  def create?
    @user.is_a? :district_superintendent
  end

  def update?
    user_is_staff?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def user_is_staff?
    @user.has_role?(:teacher) || @user.has_role?(:district_superintendent)
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.has_role? :district_superintendent
        @scope = @user.as_a(:district_superintendent).district.teachers
      elsif @user.has_role? :teacher
        @scope = Teacher.where(user_id: @user.id)
      end
      @scope
    end
  end
end