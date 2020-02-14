# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
