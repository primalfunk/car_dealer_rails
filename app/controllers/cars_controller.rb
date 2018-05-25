class CarsController < ApplicationController
  def index
    @cars = Car.order(year: :DESC, msrp: :ASC)
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car.id)
    else
      render :new
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to cars_path
    else
      render :edit
    end
  end

  def destroy
    Car.find(params[:id]).destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :color, :msrp, :used)
  end
end
