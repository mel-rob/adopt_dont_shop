require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can create shelter" do

    visit '/shelters'

    expect(page).to have_link('Create New')
    expect(page).not_to have_content('The Aviary')

    click_link 'Create New'

    expect(current_path).to eq('/shelters/new')
    expect(page).to have_button('Submit')

    fill_in 'name', with: 'The Aviary'
    fill_in 'address', with: '27 Skylark Drive'
    fill_in 'city', with: 'Denver'
    fill_in 'state', with: 'CO'
    fill_in 'zip', with: '80215'

    click_button 'Submit'

    expect(current_path).to eq('/shelters')
    expect(page).to have_content('The Aviary')
  end
end
