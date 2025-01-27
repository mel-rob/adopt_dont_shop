require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name:     "Reptile Room",
                               address:   "2364 Desert Lane",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "80211")

    @shelter_2 = Shelter.create(name:    "Fish Farm",
                               address:  "8473 Ocean Drive",
                               city:     "Denver",
                               state:    "CO",
                               zip:      "80232")
  end

  it "has a link to delete shelter" do

    visit '/shelters'

    expect(page).to have_content(@shelter_1.name)

    expect(page).to have_link('Delete')
  end

  it "has a link to delete shelter which when clicked deletes the shelter" do

    visit "/shelters/#{@shelter_1.id}"

    click_link 'Delete'

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(@shelter_1.name)
  end
end
