class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actor_names
    actors_sort = actors.sort_by {|actor| actor.age}
    actors_sort.map {|actor| actor.name}
  end

  def avg_actor_age
    sum_age = actors.sum {|actor| actor.age}
    (sum_age/actors.length.to_f).round(3)
  end
end
