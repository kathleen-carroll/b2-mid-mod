class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
  end

  def create
    movie = Movie.find(params[:id])
    actor = Actor.find_by(name: params[:name])
    movie.actors.push(actor)
    redirect_to "/movies/#{movie.id}"
  end
end
