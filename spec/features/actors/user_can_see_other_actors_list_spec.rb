require 'rails_helper'

RSpec.describe "When user visits a actor's show page" do
  it "can see list of actors they've worked with" do
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
    brad_pitt = Actor.create(name: "Brad Pitt",
                             age: 50,
                             movies: [movie1])
    kate_winslet = Actor.create(name: "Kate Winslet",
                                age: 37,
                                movies: [movie3])
    jonah = Actor.create(name: "Jonah Hill",
                                age: 33,
                                movies: [movie2])


    visit "/actors/#{leo.id}"

    expect(page).to have_content("Former Costars: #{margot_robbie.name}, #{jonah.name}, #{kate_winslet.name}, and #{brad_pitt.name}")
  end
end
