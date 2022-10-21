class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
    @characters = Character.where("show_id LIKE ?", params[:id]).order(name: :asc).page(params[:page])
  end
end
