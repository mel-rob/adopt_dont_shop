class Pet < ApplicationRecord
  belongs_to :shelter

  validates_presence_of :image,
                        :name,
                        :desc,
                        :age,
                        :sex,
                        :status

  def self.pet_order
    order(:status)
  end
end
