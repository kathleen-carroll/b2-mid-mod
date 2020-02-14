class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def movie_names
    # actor = Actor.find(params[:id])
    movies.map do |movie|
      movie.name
    end
  end

  def costars
    actors = movies.map {|movie| movie.actors}.flatten.uniq
    sorted = actors.sort_by {|actor| actor.age}
    costars = sorted.find_all{|actor| actor.name != self.name}
    costars.map {|costar| costar.name}
  end
end
