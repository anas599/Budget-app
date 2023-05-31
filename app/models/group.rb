class Group < ApplicationRecord
  belongs_to :user
  has_many :entity_groups
  has_many :entities, through: :entity_groups
  validates :name, presence: true, length: { maximum: 30 }
  validates :icon, presence: true
end
