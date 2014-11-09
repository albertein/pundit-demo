class Authenticated::ParentsController < Authenticated::AuthenticatedController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @parents = Parent.all
    respond_with(@parents)
  end

  def show
    respond_with(@parent)
  end

  def new
    @parent = Parent.new
    respond_with(@parent)
  end

  def edit
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.save
    respond_with(@parent)
  end

  def update
    @parent.update(parent_params)
    respond_with(@parent)
  end

  def destroy
    @parent.destroy
    respond_with(@parent)
  end

  private
    def set_parent
      @parent = Parent.find(params[:id])
    end

    def parent_params
      params.require(:parent).permit(:name, :user_id)
    end
end
