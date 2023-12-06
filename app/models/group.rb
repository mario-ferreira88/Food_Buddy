class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :events, dependent: :destroy
  has_one_attached :photo
  has_one :chatroom, dependent: :destroy

  def members
    users + [owner]
  end

  after_create :create_chatroom

  private

  def create_chatroom
    create_chatroom!(name: "Chatroom for #{name}")
  end
  
  def categories
    users.map(&:categories).flatten.uniq
  end
end
