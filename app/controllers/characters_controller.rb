class CharactersController < ApplicationController
  def index
    @characters = Character.order(name: :asc).page(params[:page])
  end

  def search
    search_param = "%#{params[:keywords]}%"
    @characters = Character.where("name LIKE ?", search_param)
  end

  def show
    @character = Character.find(params[:id])
  end
end
