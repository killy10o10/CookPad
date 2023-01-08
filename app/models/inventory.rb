class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods
  has_many :shopping_lists

  validates :name, presence: true
  validates :description, presence: true
end
