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
  end

  it "has link to edit each shelter from shelters index page" do

    visit '/shelters'

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)

    within "##{@shelter_1.id}-section" do
      expect(page).to have_link('Edit')
    end

    within "##{@shelter_2.id}-section" do
      expect(page).to have_link('Edit')
    end
  end

  it "has link to edit each shelter which when clicked goes to shelter edit form" do

    visit '/shelters'

    within "##{@shelter_1.id}-section" do
      click_link 'Edit'
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
  end
end
