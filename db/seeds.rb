# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@shelter_1 = Shelter.create(name:    "Reptile Room",
                            address: "2364 Desert Lane",
                            city:    "Denver",
                            state:   "CO",
                            zip:     "80211")
@shelter_2 = Shelter.create(name:    "Fish Farm",
                            address: "8473 Ocean Drive",
                            city:    "Denver",
                            state:   "CO",
                            zip:     "80232")
@shelter_3 = Shelter.create(name:    "The Aviary",
                            address: "27 Skylark Drive",
                            city:    "Denver",
                            state:   "CO",
                            zip:     "80215")

@pet_1 = Pet.create(image:      "https://cdn.shopify.com/s/files/1/0341/4893/products/joorvl5fxa7oxccvhj72.jpg?v=1553159130",
                    name:       "Alfredo",
                    desc:       "I'm a white ball python named Alfredo!",
                    age:        "4",
                    sex:        "female",
                    status:     "adoptable",
                    shelter_id: @shelter_1.id)
@pet_2 = Pet.create(image:     "https://www.geek.com/wp-content/uploads/2019/04/pantherchameleon1-625x352.jpg",
                   name:       "Poppy",
                   desc:       "I'm a panther chameleon! I am not very social but am fun to look at.",
                   age:        "2",
                   sex:        "male",
                   status:     "adoptable",
                   shelter_id: @shelter_1.id)
@pet_3 = Pet.create(image:      "https://localtvwiti.files.wordpress.com/2016/06/thinkstockphotos-528306066.jpg?quality=85&strip=all&w=400&h=225&crop=1",
                    name:       "Betsy",
                    desc:       "I'm a blue tang fish. You might recognize me from the movie 'Finding Nemo'! I require a salt water tank.",
                    age:        "1",
                    sex:        "female",
                    status:     "adoptable",
                    shelter_id: @shelter_2.id)
