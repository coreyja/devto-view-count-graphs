# frozen_string_literal: true

class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name: ENV.fetch('BASIC_AUTH_USERNAME'),
    password: ENV.fetch('BASIC_AUTH_PASSWORD')
  )

  private

  def current_user
    User.first
  end
end
