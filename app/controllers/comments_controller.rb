# frozen_string_literal: true

class CommentsController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
  end
end
