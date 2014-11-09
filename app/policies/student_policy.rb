class StudentPolicy < ApplicationPolicy

  def index?
    # We are not checking for the user since we're trusting on the scope_policy to filter
    # on what you can actually see
    true
  end

  def show?
    true
  end

  def create?
    @user.is_a?(:teacher) || @user.is_a?(:district_superintendent)
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    false
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
        @scope = @scope.all
      elsif @user.has_role? :teacher
        @scope = @user.as_a(:teacher).alumni
      elsif @user.has_role? :parent
        @scope = @user.as_a(:parent).students
      elsif @user.has_role? :student
        # We might be tempted to use @user.as_a :student but that would give us a Student object
        # But our scope policies expect an ActiveRecord::Relation, hence the query to Student
        @scope = Student.where(user_id: @user.id)
      end
      @scope
    end
  end
end