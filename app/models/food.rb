class Food < ApplicationRecord
  has_many :recipe_food, dependent: :destroy
  belongs_to :user
end
