class Authenticated::TeachersController < Authenticated::AuthenticatedController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @teachers = policy_scope(Teacher)
    authorize @teachers
    respond_with(@teachers)
  end

  def show
    respond_with(@teacher)
  end

  def new
    @teacher = Teacher.new
    authorize @teacher
    respond_with(@teacher)
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.save
    respond_with(@teacher)
  end

  def update
    @teacher.update(teacher_params)
    respond_with(@teacher)
  end

  def destroy
    @teacher.destroy
    respond_with(@teacher)
  end

  private
    def set_teacher
      @teacher = policy_scope(Teacher).find_by_id(params[:id]) or not_found
      authorize @teacher
    end

    def teacher_params
      params.require(:teacher).permit(:name, :school_id, :user_id)
    end
end
