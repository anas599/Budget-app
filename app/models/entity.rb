class Entity < ApplicationRecord
  belongs_to :user
  has_many :entity_groups
  has_many :groups, through: :entity_groups
  validates :name, presence: true, length: { maximum: 30 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
