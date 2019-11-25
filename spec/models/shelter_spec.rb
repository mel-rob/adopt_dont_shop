require 'rails_helper'

RSpec.describe Shelter, type: :model do
  before(:each) do
    @shelter_1 = Shelter.create(name:     "Reptile Room",
                               address:  "2364 Desert Lane",
                               city:     "Denver",
                               state:    "CO",
                               zip:      "80211")

    @pet_1 = Pet.create(image: "https://cdn.shopify.com/s/files/1/0341/4893/products/joorvl5fxa7oxccvhj72.jpg?v=1553159130",
                       name:  "Alfredo",
                       desc:  "I'm a white ball python named Alfredo!",
                       age:   "4",
                       sex:   "female",
                       status:"adoptable",
                       shelter_id: @shelter_1.id)

    @pet_2 = Pet.create(image: "https://www.geek.com/wp-content/uploads/2019/04/pantherchameleon1-625x352.jpg",
                       name:  "Poppy",
                       desc:  "I'm a panther chameleon! I am not very social but am fun to look at.",
                       age:   "2",
                       sex:   "male",
                       status:"adoptable",
                       shelter_id: @shelter_1.id)

   @pet_3 = Pet.create(image:      "http://reptile.guide/wp-content/uploads/2019/02/Bearded-dragon-poop-.jpg",
                       name:       "Chive",
                       desc:       "I'm a bearded dragon. I like to hunt and be active during the daytime.",
                       age:        "5",
                       sex:        "male",
                       status:     "pending adoption",
                       shelter_id: @shelter_1.id)
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe "relationships" do
    it { should have_many :pets }
  end

  it "a user can see shelter's adoptable pets " do

    expect(@shelter_1.adoptable_pets).to include(@pet_1, @pet_2)
    expect(@shelter_1.adoptable_pets).not_to include(@pet_3)
  end

  it "can see number of pets at shelter" do

    expect(@shelter_1.pet_count).to eq(3)
  end

  it "can see adoptable pets first before pending_adoption pets" do

    expect(@shelter_1.pet_order).to match_array [@pet_1, @pet_2, @pet_3]
  end


end
