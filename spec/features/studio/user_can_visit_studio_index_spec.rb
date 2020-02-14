require 'rails_helper'

RSpec.describe "As a user when i visit the studio index" do
  it "can see a list of all studios" do
    studio1 = Studio.create(name: "KC Productions")
    studio2 = Studio.create(name: "Movie Studios")
    movie1 = Movie.create(name: "Once Upon A Time",
                          creation_year: 2019,
                          genre: "",
                          studio: studio1)
    movie2 = Movie.create(name: "Kill Bill 3",
                          creation_year: 2022,
                          genre: "girls kickin' ass",
                          studio: studio1)
    movie3 = Movie.create(name: "Drive",
                          creation_year: 2022,
                          genre: "thriller",
                          studio: studio2)
    movie4 = Movie.create(name: "To All the Boys I've Loved",
                          creation_year: 2018,
                          genre: "Rom-com",
                          studio: studio2)

    visit '/studios'

    expect(page).to have_content("#{studio1.name}")
    expect(page).to have_content("#{movie1.name}")
    expect(page).to have_content("#{movie2.name}")
    expect(page).to have_content("#{studio2.name}")
    expect(page).to have_content("#{movie3.name}")
    expect(page).to have_content("#{movie4.name}")
  end
end
