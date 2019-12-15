class CitiesController < ApplicationController
  def show
    @city = City.find params[:id]
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new city_params
    if @city.save
      flash[:success] = "create success"
      redirect_to @city
    else
      render :new
    end
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end
