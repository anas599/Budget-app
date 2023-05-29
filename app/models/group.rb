class Group < ApplicationRecord
  belongs_to :user
  # belongs_to :entity

  # has_many :group_entities, dependent: :destroy

  # has_many :entities
  # has_many :entities, through: :group_entities

  has_many :entity_groups
  has_many :entities, through: :entity_groups
  # validates :name, presence: true, length: { maximum: 30 }
  # validates :icon, presence: true
end
