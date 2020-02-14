class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
end
