require 'rails_helper'

RSpec.describe "pet show page", type: :feature do
  it "can update pet" do

    shelter_1 = Shelter.create(name:     "Reptile Room",
                               address:  "2364 Desert Lane",
                               city:     "Denver",
                               state:    "CO",
                               zip:      "80211")

     pet_1 = Pet.create(image: "https://cdn.shopify.com/s/files/1/0341/4893/products/joorvl5fxa7oxccvhj72.jpg?v=1553159130",
                        name:  "Alfredo",
                        desc:  "I'm a white ball python named Alfredo!",
                        age:   "4",
                        sex:   "female",
                        status:"adoptable",
                        shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    expect(page).to have_link('Update')

    click_link 'Update'

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    expect(page).to have_button('Submit')

    fill_in 'name', with: "Spaghetti"

    click_button 'Submit'
    expect(current_path).to eq("/pets/#{pet_1.id}")

    expect(page).to have_content("Spaghetti")
    expect(page).not_to have_content("Name: Alfredo")
  end
end
