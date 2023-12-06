class Event < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, optional: true
  belongs_to :group, optional: true

  delegate :categories, to: :group, prefix: true

  def progress
    return 10 unless name
    return 30 unless date
    return 80 unless restaurant

    100
  end

  def restaurants
    if group_id.nil? # if event is not associated with a group (i.e. it's a solo event)
      user_restaurant_categories = RestaurantCategory.where(category: user.profile.profile_categories)
      Restaurant.where(restaurant_categories: user_restaurant_categories)
    else # if event is associated with a group
      group_restaurant_categories = RestaurantCategory.where(category: group_categories)
      Restaurant.where(restaurant_categories: group_restaurant_categories)
    end
  end

  def group?
    group.present?
  end

  def group_categories
    group.members.map(&:profile).map(&:categories).flatten.uniq
  end
end
