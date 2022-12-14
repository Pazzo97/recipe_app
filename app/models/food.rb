class Food < ApplicationRecord
  has_many :recipe_food, dependent: :delete_all
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :measurement_unit, presence: true, length: { maximum: 50 }
  validates :price, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true }
end
