class GroupEntity < ApplicationRecord
  belongs_to :entity
  belongs_to :group
  validates :icon, presence: true
  validates :name, presence: true, length: { maximum: 30 }
end
