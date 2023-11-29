class User < ApplicationRecord
  has_one :profile
  has_many :user_groups
  has_many :groups, through: :user_groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
