class EpisodesController < ApplicationController
  def index
    @episodes = Episode.order(episode_number: :asc).page(params[:page])
  end

  def show
    @episode = Episode.find(params[:id])
  end
end
