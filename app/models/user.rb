class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true, length: { maximum: 30 }
  Roles = [ :admin , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end
end
