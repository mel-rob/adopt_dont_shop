require 'rails_helper'

RSpec.describe "all pages" do
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

  it "have a link to navigate to the shelters index" do

    visit "/"
    expect(page).to have_link('Shelters')

    visit "/shelters"
    expect(page).to have_link('Shelters')

    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_link('Shelters')

    visit "/shelters/#{@shelter_1.id}/pets"
    expect(page).to have_link('Shelters')

    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_link('Shelters')
  end

  it "have a link which when clicked navigates to the shelters index" do

    visit "/"
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')

    visit "/shelters"
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')

    visit "/shelters/#{@shelter_1.id}"
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')

    visit "/shelters/#{@shelter_1.id}/pets"
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')

    visit "/shelters/#{@shelter_1.id}"
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')
  end
end
