require 'rails_helper'

RSpec.describe "shelter pets index", type: :feature do
  it "can create pet" do
      shelter_1 = Shelter.create(name:     "Reptile Room",
                                 address:  "2364 Desert Lane",
                                 city:     "Denver",
                                 state:    "CO",
                                 zip:      "80211")

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_link 'New Pet'
    click_link 'New Pet'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    expect(page).to have_button 'Submit'

    fill_in 'image', :with => 'http://reptile.guide/wp-content/uploads/2019/02/Bearded-dragon-poop-.jpg'
    fill_in 'name', :with => 'Chive'
    fill_in 'desc', :with => "I'm a bearded dragon. I like to hunt and be active during the daytime."
    fill_in 'age', :with => '5'
    select 'male', from: :sex

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")

    expect(page).to have_content('Chive')
    expect(page).to have_content('Age (approx): 5')
    expect(page).to have_content('Sex: male')
  end
end
