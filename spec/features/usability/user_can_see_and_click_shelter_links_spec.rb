require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name:     "Reptile Room",
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
                       name:  "Alfredo",
                       desc:  "I'm a white ball python named Alfredo!",
                       age:   "4",
                       sex:   "female",
                       status:"adoptable",
                       shelter_id: @shelter_1.id)
  end

  it "can click on shelter name in shelters index and link to shelter show page" do

    visit '/shelters'

    expect(page).to have_link("Reptile Room")
    expect(page).to have_link("Fish Farm")

    click_link "Reptile Room"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
  end

  it "can click on shelter name in pets index and link to shelter show page" do

    visit '/pets'

    expect(page).to have_link("Reptile Room")

    click_link "Reptile Room"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
  end
end
