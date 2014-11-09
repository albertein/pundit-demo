class DistrictSuperintendentsController < ApplicationController
  before_action :set_district_superintendent, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @district_superintendents = DistrictSuperintendent.all
    respond_with(@district_superintendents)
  end

  def show
    respond_with(@district_superintendent)
  end

  def new
    @district_superintendent = DistrictSuperintendent.new
    respond_with(@district_superintendent)
  end

  def edit
  end

  def create
    @district_superintendent = DistrictSuperintendent.new(district_superintendent_params)
    @district_superintendent.save
    respond_with(@district_superintendent)
  end

  def update
    @district_superintendent.update(district_superintendent_params)
    respond_with(@district_superintendent)
  end

  def destroy
    @district_superintendent.destroy
    respond_with(@district_superintendent)
  end

  private
    def set_district_superintendent
      @district_superintendent = DistrictSuperintendent.find(params[:id])
    end

    def district_superintendent_params
      params.require(:district_superintendent).permit(:name, :district_id, :user_id)
    end
end
