require 'rails_helper'

RSpec.describe "As a user when I visit actor show page" do
  it "can see their name, age, and list of movies they're in" do
    studio1 = Studio.create(name: "KC Productions")
    movie1 = Movie.create(name: "Once Upon A Time",
                          creation_year: 2019,
                          genre: "dark comedy",
                          studio: studio1)
    movie2 = Movie.create(name: "Wolf of Wall Street",
                          creation_year: 2016,
                          genre: "true story fictionalized",
                          studio: studio1)
    movie3 = Movie.create(name: "Titanic",
                          creation_year: 1992,
                          genre: "Romantic",
                          studio: studio1)
    margot_robbie = Actor.create(name: "Margot Robbie",
                                 age: 31,
                                 movies: [movie1, movie2])
    leo = Actor.create(name: "Leonardo Dicaprio",
                       age: 48,
                       movies: [movie1, movie2, movie3])

    visit "/actors/#{margot_robbie.id}"

    expect(page).to have_content("#{margot_robbie.name}")
    expect(page).to have_content("Age: #{margot_robbie.age}")
    expect(page).to have_content("Movies: #{movie1}, #{movie2}")
    expect(page).to_not have_content("#{movie3}")
  end
end
