require 'rails_helper'

RSpec.describe "As a user when i visit the studio index" do
  it "can see a list of all studios" do
    studio1 = Studio.create(name: "KC Productions")
    studio2 = Studio.create(name: "Movie Studios")
    movie1 = Movie.create(name: "Once Upon A Time",
                          studio: studio1)
    movie2 = Movie.create(name: "Kill Bill 3",
                          studio: studio1)
    movie3 = Movie.create(name: "Drive",
                          studio: studio2)
    movie4 = Movie.create(name: "To All the Boys I've Loved",
                          studio: studio2)

    expect(page).to have_content("#{studio1.name}")
    expect(page).to have_content("#{studio2.name}")
    expect(page).to_not have_content("#{movie2.name}")
  end
end
