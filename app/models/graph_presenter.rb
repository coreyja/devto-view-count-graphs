# frozen_string_literal: true

class GraphPresenter
  include ActiveModel::Model
  include ActionView::Helpers::DateHelper

  attr_accessor :article, :reset_url

  def start_at
    @start_at || min_start_at
  end

  def end_at
    @end_at || max_end_at
  end

  def start_at=(val)
    val = Time.zone.parse(val) if val.is_a?(String)
    @start_at = val
  end

  def end_at=(val)
    val = Time.zone.parse(val) if val.is_a?(String)
    @end_at = val
  end

  def article_stats
    article.article_stats.where(recorded_at: start_at.beginning_of_day..end_at.end_of_day)
  end

  def min_start_at
    article.article_stats.order(recorded_at: :asc).limit(1).pick(:recorded_at).to_date
  end

  def max_end_at
    Time.zone.today
  end

  def timespan_in_words
    distance_of_time_in_words(start_at.beginning_of_day, end_at.end_of_day)
  end
end
