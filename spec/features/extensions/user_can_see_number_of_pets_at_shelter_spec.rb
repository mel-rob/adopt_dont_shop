require 'rails_helper'

RSpec.describe "shelter-pets index", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name:      "Reptile Room",
                                 address:  "2364 Desert Lane",
                                 city:     "Denver",
                                 state:    "CO",
                                 zip:      "80211")

    @pet_1 = Pet.create(image:  "https://cdn.shopify.com/s/files/1/0341/4893/products/joorvl5fxa7oxccvhj72.jpg?v=1553159130",
                         name:  "Alfredo",
                         desc:  "I'm a white ball python named Alfredo!",
                         age:   "4",
                         sex:   "female",
                         status:"adoptable",
                         shelter_id: @shelter_1.id)

    @pet_2 = Pet.create(image:  "https://www.geek.com/wp-content/uploads/2019/04/pantherchameleon1-625x352.jpg",
                         name:  "Poppy",
                         desc:  "I'm a panther chameleon! I am not very social but am fun to look at.",
                         age:   "2",
                         sex:   "male",
                         status:"adoptable",
                         shelter_id: @shelter_1.id)
  end

  it "can see the count of pets at each shelter" do

    visit "/shelters/#{@shelter_1.id}/pets"

    expect(page).to have_content("All Pets at #{@shelter_1.name}: 2")
  end
end
