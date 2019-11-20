require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can create shelter" do
    shelter_1 = Shelter.create(name:     "Reptile Room",
                               address:  "2364 Desert Lane",
                               city:     "Denver",
                               state:    "CO",
                               zip:      "80211")

    shelter_2 = Shelter.create(name:    "Fish Farm",
                               address: "8473 Ocean Drive",
                               city:    "Denver",
                               state:   "CO",
                               zip:     "80232")

    visit '/shelters'

    expect(page).to have_link('Create New')

    click_link

    expect(current_path).to eq('/shelters/new')

    expect(page).to have_button('Submit')

    fill_in 'name', :with => 'The Aviary'
    fill_in 'address', :with => '27 Skylark Drive'
    fill_in 'city', :with => 'Denver'
    fill_in 'state', :with => 'CO'
    fill_in 'zip', :with => '80215'

    click_button

    expect(current_path).to eq('/shelters')
    expect(page).to have_content('The Aviary')
  end
end
