require 'rails_helper'

RSpec.describe "When user visits a movie's show page" do
  it "can add actor in database to movie and see it on show page" do
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

    visit "/movies/#{movie1.id}"

    expect(page).to_not have_content("#{kate_winslet.name}")
    expect(page).to have_content("Actors: #{margot_robbie.name}, #{leo.name}, and #{brad_pitt.name}")
    expect(page).to have_content("Average age of Actors: 43")
    expect(page).to have_button("Add Actor")

    fill_in :name, with: "#{kate_winslet.name}"
    click_button "Add Actor"

    expect(current_path).to eq("/movies/#{movie1.id}")
    expect(page).to have_content("Actors: #{margot_robbie.name}, #{leo.name}, #{brad_pitt.name}, and #{kate_winslet.name}")
  end
end
