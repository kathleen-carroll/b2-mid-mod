class StudiosController < ApplicationController
  def index
    @studios = Studio.all
    # require "pry"; binding.pry
    # Movie.find_by(studio_id: @studio.id)
  end
end
