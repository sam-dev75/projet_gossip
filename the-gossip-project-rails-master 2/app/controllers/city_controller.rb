class CityController < ApplicationController

  def show
    @city = City.find(params[:id])
    @gossips_city = City.find(params[:id]).gossips
  end
end
