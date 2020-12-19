# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(published_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end
end
