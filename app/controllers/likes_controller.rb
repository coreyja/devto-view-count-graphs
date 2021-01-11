# frozen_string_literal: true

class LikesController < ApplicationController
  class Presenter
    include ActiveModel::Model

    attr_accessor :article

    def start_at
      @start_at || min_start_at
    end

    def end_at
      @end_at || max_end_at
    end

    def start_at=(val)
      val = Date.parse(val) if val.is_a?(String)
      @start_at = val
    end

    def end_at=(val)
      val = Date.parse(val) if val.is_a?(String)
      @end_at = val
    end

    def article_stats
      article.article_stats.where(recorded_at: start_at.at_beginning_of_day..end_at.at_end_of_day)
    end

    def min_start_at
      article.article_stats.order(recorded_at: :asc).limit(1).pluck(:recorded_at).first.to_date
    end

    def max_end_at
      Time.zone.now.to_date
    end
  end

  def show
    @article = Article.find(params[:article_id])
    @article_stats = @article.article_stats
    @presenter = Presenter.new(params.permit(:start_at, :end_at).merge(article: @article))
  end
end
