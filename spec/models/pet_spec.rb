require 'rails_helper'

RSpec.describe Pet, type: :model do
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
    it { should validate_presence_of :image }
    it { should validate_presence_of :name }
    it { should validate_presence_of :desc }
    it { should validate_presence_of :age }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :status }
  end

  describe "relationships" do
    it { should belong_to :shelter }
  end

  describe "methods" do
    it "should show pets in order first by adoption" do
      expect(Pet.all.pet_order).to match_array [@pet_1, @pet_2, @pet_3]
    end
  end
end
