class Event < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, optional: true
  belongs_to :group, optional: true

  delegate :categories, to: :group, prefix: true

  def self.progress_back
    {
      30 => 10,
      80 => 30,
      100 => 80
    }
  end

  def progress
    return 10 unless name
    return 30 unless date
    return 80 unless restaurant

    100
  end

  def restaurants
    Restaurant.geocoded.select do |restaurant|
      restaurant.categories.any? { |category| category.in?(categories) }
    end
  end

  def group?
    group.present?
  end

  def categories
    group? ? group_categories : user.profile.categories
  end

  def matching_score(restaurant)
    matching_categories = []
    restaurant.categories.each do |category|
      matching_categories << category if category.in?(categories)
    end

    matching_categories.count.to_f / categories.count
  end
end
