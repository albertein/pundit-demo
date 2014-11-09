class Authenticated::SchoolClassesController < Authenticated::AuthenticatedController
  before_action :set_school_class, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @school_classes = SchoolClass.all
    respond_with(@school_classes)
  end

  def show
    respond_with(@school_class)
  end

  def new
    @school_class = SchoolClass.new
    respond_with(@school_class)
  end

  def edit
  end

  def create
    @school_class = SchoolClass.new(school_class_params)
    @school_class.save
    respond_with(@school_class)
  end

  def update
    @school_class.update(school_class_params)
    respond_with(@school_class)
  end

  def destroy
    @school_class.destroy
    respond_with(@school_class)
  end

  private
    def set_school_class
      @school_class = SchoolClass.find(params[:id])
    end

    def school_class_params
      params.require(:school_class).permit(:name, :school_id, :teacher_id)
    end
end
