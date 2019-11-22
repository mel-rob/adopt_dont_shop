
Shelter.destroy_all
Pet.destroy_all

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
@pet_4 = Pet.create(image: "http://reptile.guide/wp-content/uploads/2019/02/Bearded-dragon-poop-.jpg",
                    name:  'Chive',
                    desc:  "I'm a bearded dragon. I like to hunt and be active during the daytime.",
                    age: '5',
                    sex: 'male',
                    status: "pending_adoption",
                    shetler_id: @shelter_1.id)
@pet_5 = Pet.create(image: "https://lafeber.com/pet-birds/wp-content/uploads/2018/06/Lovebird-300x300.jpg",
                    name: 'Charlene',
                    age: '3',
                    sex: 'female'
                    status: "adoptable",
                    shelter_id: @shelter_3.id)
@pet_6 = Pet.create(image: "https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/153546296-items-dangerous-pet-birds.jpg",
                    name: 'Zoe',
                    age: '8',
                    sex: 'female'
                    status: "pending_adoption",
                    shelter_id: @shelter_3.id)
@pet_7 = Pet.create(image: "https://storage.makerist.de/uploads/orderable_image/226835/image/carousel_large_image_a0dd000d.jpg",
                    name: 'Fancy',
                    age: '5',
                    sex: 'female',
                    status: 'adoptable',
                    shelter_id: @shelter_2.id)
@pet_8 = Pet.create(image: "https://m.liveaquaria.com/images/categories/large/lg80188OcellarisClownfish.jpg",
                    name: 'Pumpkin',
                    age: '3',
                    sex: 'male',
                    status: 'pending_adoption',
                    shelter_id: @shelter_2.id)
