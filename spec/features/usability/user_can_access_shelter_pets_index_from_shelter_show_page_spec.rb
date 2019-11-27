require 'rails_helper'

RSpec.describe "shelters show page" do
  before(:each) do
    @shelter_1 = Shelter.create(name:     "Reptile Room",
                               address:  "2364 Desert Lane",
                               city:     "Denver",
                               state:    "CO",
                               zip:      "80211")
  end

  it "has a link to access shelter pets index" do

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_link("All Pets at #{@shelter_1.name}")

    click_link "All Pets at #{@shelter_1.name}"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
  end
end
