class Group < ApplicationRecord
  belongs_to :user
  belongs_to :entity
  has_and_belongs_to_many :entity
  validates :name, presence: true, length: { maximum: 30 }
  validates :icon, presence: true
  
end
