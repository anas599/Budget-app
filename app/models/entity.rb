class Entity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :group
  validates :name, presence: true, length: { maximum: 30 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
