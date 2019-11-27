require 'rails_helper'

RSpec.describe "pets index", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name:  "Reptile Room",
                             address:  "2364 Desert Lane",
                             city:     "Denver",
                             state:    "CO",
                             zip:      "80211")

   @shelter_2 = Shelter.create(name:    "Fish Farm",
                              address: "8473 Ocean Drive",
                              city:    "Denver",
                              state:   "CO",
                              zip:     "80232")

    @pet_1 = Pet.create(image: "https://cdn.shopify.com/s/files/1/0341/4893/products/joorvl5fxa7oxccvhj72.jpg?v=1553159130",
                     name:     "Alfredo",
                     desc:     "I'm a white ball python named Alfredo!",
                     age:      "4",
                     sex:      "female",
                     status:   "adoptable",
                     shelter_id: @shelter_1.id)

    @pet_2 = Pet.create(image: "https://www.geek.com/wp-content/uploads/2019/04/pantherchameleon1-625x352.jpg",
                     name:     "Poppy",
                     desc:     "I'm a panther chameleon! I am not very social but am fun to look at.",
                     age:      "2",
                     sex:      "male",
                     status:   "adoptable",
                     shelter_id: @shelter_1.id)

    @pet_3 = Pet.create(image:  "http://reptile.guide/wp-content/uploads/2019/02/Bearded-dragon-poop-.jpg",
                     name:      "Chive",
                     desc:      "I'm a bearded dragon. I like to hunt and be active during the daytime.",
                     age:       "5",
                     sex:       "male",
                     status:    "pending adoption",
                     shelter_id: @shelter_1.id)

    @pet_4 = Pet.create(image:   "https://localtvwiti.files.wordpress.com/2016/06/thinkstockphotos-528306066.jpg?quality=85&strip=all&w=400&h=225&crop=1",
                        name:    "Betsy",
                        desc:    "I'm a blue tang fish. You might recognize me from the movie 'Finding Nemo'! I require a salt water tank.",
                        age:     "1",
                        sex:     "female",
                        status:  "adoptable",
                        shelter_id: @shelter_2.id)
  end

  it "can see adoptable pets first on pets index" do

    visit '/pets'

    expect(page.body.index("Alfredo")).to be < page.body.index("Chive")
    expect(page.body.index("Poppy")).to be < page.body.index("Chive")
    expect(page.body.index("Betsy")).to be < page.body.index("Chive")
  end


  it "can see adoptable pets first on shelter-pets index" do

    visit "/shelters/#{@shelter_1.id}/pets"

    expect(page.body.index("Alfredo")).to be < page.body.index("Chive")
    expect(page.body.index("Poppy")).to be < page.body.index("Chive")
  end
end
