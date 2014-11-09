class DistrictsController < ApplicationController
  before_action :set_district, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @districts = District.all
    respond_with(@districts)
  end

  def show
    respond_with(@district)
  end

  def new
    @district = District.new
    respond_with(@district)
  end

  def edit
  end

  def create
    @district = District.new(district_params)
    @district.save
    respond_with(@district)
  end

  def update
    @district.update(district_params)
    respond_with(@district)
  end

  def destroy
    @district.destroy
    respond_with(@district)
  end

  private
    def set_district
      @district = District.find(params[:id])
    end

    def district_params
      params.require(:district).permit(:name)
    end
end
