class ClassEnrollmentsController < ApplicationController
  before_action :set_class_enrollment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @class_enrollments = ClassEnrollment.all
    respond_with(@class_enrollments)
  end

  def show
    respond_with(@class_enrollment)
  end

  def new
    @class_enrollment = ClassEnrollment.new
    respond_with(@class_enrollment)
  end

  def edit
  end

  def create
    @class_enrollment = ClassEnrollment.new(class_enrollment_params)
    @class_enrollment.save
    respond_with(@class_enrollment)
  end

  def update
    @class_enrollment.update(class_enrollment_params)
    respond_with(@class_enrollment)
  end

  def destroy
    @class_enrollment.destroy
    respond_with(@class_enrollment)
  end

  private
    def set_class_enrollment
      @class_enrollment = ClassEnrollment.find(params[:id])
    end

    def class_enrollment_params
      params.require(:class_enrollment).permit(:school_class_id, :student_id, :grade)
    end
end
