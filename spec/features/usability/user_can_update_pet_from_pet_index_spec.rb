require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name:    "Reptile Room",
                               address:  "2364 Desert Lane",
                               city:     "Denver",
                               state:    "CO",
                               zip:      "80211")


    @pet_1 = Pet.create(image: "https://cdn.shopify.com/s/files/1/0341/4893/products/joorvl5fxa7oxccvhj72.jpg?v=1553159130",
                      name:    "Alfredo",
                      desc:    "I'm a white ball python named Alfredo!",
                      age:     "4",
                      sex:     "female",
                      status:  "adoptable",
                      shelter_id: @shelter_1.id)
  end

  it "has link to update each pet from pets index page" do

    visit '/pets'

    expect(page).to have_link('Edit')
  end

  it "has link which when clicked goes to the pet edit form for that pet" do

    visit '/pets'

    click_link 'Edit'

    expect(current_path).to eq("/pets/#{@pet_1.id}/edit")

    expect(page).to have_button('Submit')
  end

  it "allows a user to edit the pet from the pet edit form" do

    visit "/pets/#{@pet_1.id}/edit"

    fill_in 'name', with: "Spaghetti"

    click_button 'Submit'
    expect(current_path).to eq("/pets/#{@pet_1.id}")

    expect(page).to have_content("Spaghetti")
    expect(page).not_to have_content("Name: Alfredo")
  end
end
