require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can update shelter from shelter index page" do
    shelter_1 = Shelter.create(name:     "Reptile Room",
                               address:  "2364 Desert Lane",
                               city:     "Denver",
                               state:    "CO",
                               zip:      "80211")

    visit '/shelters'

    expect(page).to have_content("Reptile Room")
    expect(page).to have_link('Create New')
    expect(page).to have_link('Edit')

    # click_link 'Edit'

    # expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

  end
end
