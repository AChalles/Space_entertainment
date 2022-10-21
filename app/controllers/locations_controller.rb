class LocationsController < ApplicationController
  def index
    @locations = Location.order(name: :asc).page(params[:page])
  end

  def show
    @location = Location.find(params[:id])
  end
end
