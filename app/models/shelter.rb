class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip

  def adoptable_pets
    pets.where(status: 'adoptable')
  end

  def pet_count
    pets.count
  end

end
