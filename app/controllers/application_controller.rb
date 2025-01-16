class ApplicationController < ActionController::API

  def api_metadata(objects)
    {
      current_page: objects&.current_page,
      next_page: objects&.next_page,
      prev_page: objects&.prev_page,
      total_pages: objects&.total_pages,
      total_count: objects&.total_count
    }
  end
end
