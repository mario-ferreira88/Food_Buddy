class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :events, dependent: :destroy
  has_one_attached :photo

  def members
    users + [owner]
  end

  def categories
    users.map(&:categories).flatten.uniq
  end
end
