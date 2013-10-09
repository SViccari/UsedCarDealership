class ManufacturersController < ApplicationController
  def new
    @manufacturers = Manufacturer.new
  end

  def create
    @manufacturers = Manufacturer.new(manufacturer_params)
    if @manufacturers.save
      redirect_to root_path, notice: "Manufacturer successfully saved!"
    else
      render :new
    end
  end

  protected 
  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
