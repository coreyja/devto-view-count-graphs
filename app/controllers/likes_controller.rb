# frozen_string_literal: true

class LikesController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
  end
end
