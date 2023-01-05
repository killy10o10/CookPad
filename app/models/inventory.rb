class Inventory < ApplicationRecord
  belongs_to :user
  # has_many :inventory_foods, foreign_key: 'food_id'

  validates :name, presence: true
  validates :description, presence: true
end
