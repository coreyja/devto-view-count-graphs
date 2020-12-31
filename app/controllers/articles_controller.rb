# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @most_recent_articles = Article.all.order(published_at: :desc).limit(3)
    now = Time.zone.now
    @articles_this_month = Article.where(published_at: (now.beginning_of_month..now.end_of_month)).order(published_at: :desc)
    previous_start = now.beginning_of_month - 4.months
    @articles_in_preview_3_months = Article.where(published_at: (previous_start...now.beginning_of_month)).order(published_at: :desc)
    @older_articles = Article.where('published_at < ?', previous_start).order(published_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end
end
