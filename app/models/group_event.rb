class GroupEvent < Event
  belongs_to :group
  belongs_to :event

  def progress
    return 10 unless name
    return 30 unless date
    return 50 unless group_events.any?
    return 80 unless restaurant

    100
  end
end
