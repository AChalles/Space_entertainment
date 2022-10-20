class AboutController < ApplicationController
  def index
    @characters = Character.all

    @locations = Location.all

    @users = User.all

    @episodes = Episode.all
  end
end
