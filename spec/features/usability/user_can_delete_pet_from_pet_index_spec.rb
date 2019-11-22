require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "can delete pet from pet index" do

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

    visit "/pets"

    expect(page).to have_button('Delete')

    click_button 'Delete'

    expect(current_path).to eq('/pets')
    # expect(page.not_to find("#img-#{pet_1.id}")['src']).to have_content "#{pet_1.image}"
    expect(page).not_to have_content(pet_1.name)
    expect(page).not_to have_content(pet_1.age)
    expect(page).not_to have_content(pet_1.sex)
    end
end
