class Authenticated::StudentsController < Authenticated::AuthenticatedController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @students = policy_scope(Student)
    respond_with(@students)
  end

  def show
    respond_with(@student)
  end

  def new
    @student = Student.new
    authorize @student
    respond_with(@student)
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_with(@student)
  end

  def update
    @student.update(student_params)
    respond_with(@student)
  end

  def destroy
    @student.destroy
    respond_with(@student)
  end

  private
    def set_student
      # We use find_by_id instead of find to avoid raising an ActiveRecord::RecordNotFound, instead
      # we call not_found defined on our application_controller to render our generic 404 form.
      @student = policy_scope(Student).find_by_id(params[:id]) or not_found
      authorize @student
    end

    def student_params
      params.require(:student).permit(:name, :user_id, :parent_id)
    end
end
