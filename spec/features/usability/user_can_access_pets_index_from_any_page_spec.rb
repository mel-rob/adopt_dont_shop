require 'rails_helper'

RSpec.describe "every page on the site" do
  before(:each) do
    @shelter_1 = Shelter.create(name:     "Reptile Room",
                               address:  "2364 Desert Lane",
                               city:     "Denver",
                               state:    "CO",
                               zip:      "80211")

    @pet_1 = Pet.create(image: "https://cdn.shopify.com/s/files/1/0341/4893/products/joorvl5fxa7oxccvhj72.jpg?v=1553159130",
                       name:  "Alfredo",
                       desc:  "I'm a white ball python named Alfredo!",
                       age:   "4",
                       sex:   "female",
                       status:"adoptable",
                       shelter_id: @shelter_1.id)
  end

  it "has a link to navigate to the pets index" do

    visit "/"
    expect(page).to have_link('Pets')

    visit "/shelters"
    expect(page).to have_link('Pets')

    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_link('Pets')

    visit "/shelters/#{@shelter_1.id}/pets"
    expect(page).to have_link('Pets')

    visit "/pets/#{@pet_1.id}"
    expect(page).to have_link('Pets')
  end

  it "has a link which when clicked navigates to the pets index" do

    visit "/"
    click_link 'Pets'
    expect(current_path).to eq('/pets')

    visit "/shelters"
    click_link 'Pets'
    expect(current_path).to eq('/pets')

    visit "/shelters/#{@shelter_1.id}"
    click_link 'Pets'
    expect(current_path).to eq('/pets')

    visit "/shelters/#{@shelter_1.id}/pets"
    click_link 'Pets'
    expect(current_path).to eq('/pets')

    visit "/pets/#{@pet_1.id}"
    click_link 'Pets'
    expect(current_path).to eq('/pets')
  end
end
