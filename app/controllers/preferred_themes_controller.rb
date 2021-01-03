# frozen_string_literal: true

class PreferredThemesController < ApplicationController
  def create
    current_user.update!(create_params)
  end

  private

  def create_params
    params.permit(:preferred_theme)
  end
end
