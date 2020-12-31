# frozen_string_literal: true

class PageViewsController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
  end
end
