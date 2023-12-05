class GroupEvent < Event
  belongs_to :group, optional: true # Use the singular association here
  # belongs_to :event

  def progress
    return 10 unless name
    return 30 unless date
    return 50 unless group # Use the singular association here
    return 80 unless restaurant

    100
  end
end
