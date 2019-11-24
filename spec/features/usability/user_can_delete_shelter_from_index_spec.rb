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

  it "has link to delete each individual shelter" do

    visit '/shelters'

    expect(page).to have_link('Delete', count: 2)
  end

  it "has link that when clicked deletes shelter" do

    visit '/shelters'

    within "##{@shelter_1.id}-section" do
      click_link 'Delete'
    end

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end
end
