require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can update shelter" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link('Update')

    click_link 'Update'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    expect(page).to have_button('Submit')

    fill_in 'name', with: 'Rattler Room'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content("Rattler Room")
  end
end
