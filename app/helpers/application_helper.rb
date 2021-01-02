# frozen_string_literal: true

module ApplicationHelper
  def external_url(url, params: {})
    "#{url}?#{params.to_query}"
  end
end
