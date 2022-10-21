class AboutController < ApplicationController
  def index
    @characters = Character.order(name: :asc).page(params[:page])

    @locations = Location.order(name: :asc).page(params[:page])

    @users = User.order(name: :asc).page(params[:page])

    @episodes = Episode.order(episode_number: :asc).page(params[:page])
  end
end
