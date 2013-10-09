class CarsController < ApplicationController
  def new
    @cars = Car.new
  end

  def index
    @cars = Car.all
  end

  def create
    @cars = Car.new(car_params)
    if @cars.save
      redirect_to root_path, notice: 'Car successfully saved!'
    else
      render :new
    end
  end

  protected
  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description, :manufacturer_id)
  end
end
