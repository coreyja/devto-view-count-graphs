# frozen_string_literal: true

class LikesController < ApplicationController
  def show
    article = Article.find(params[:article_id])
    @presenter = GraphPresenter.new(params.permit(:start_at, :end_at).merge(article: article))
  end
end
