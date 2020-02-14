class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def movie_names
    # actor = Actor.find(params[:id])
    movies.map do |movie|
      movie.name
    end
  end
end
