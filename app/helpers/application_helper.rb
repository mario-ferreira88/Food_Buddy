module ApplicationHelper
  def back_link_path(progress, event)
    return events_path if progress == 10

    edit_event_path(event, progress: event.class.progress_back[progress])

    # return edit_event_path(@event, progress: 10) if progress == 30
    # return edit_event_path(@event, progress: 30) if progress == 50
    # return edit_event_path(@event, progress: 50) if progress == 80
    # return edit_event_path(@event, progress: 80) if progress == 100
  end
end
