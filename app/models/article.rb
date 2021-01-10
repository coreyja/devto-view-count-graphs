# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :article_stats, dependent: :destroy

  def self.from_api!(hash)
    attrs = hash.slice('slug', 'cover_image', 'title', 'published_at')
    create_with(attrs)
      .create_or_find_by(external_id: hash['id'])
      .tap { |a| a.update!(attrs) }
  end

  def most_recent_stat
    article_stats.by_recency.first
  end

  def recommended_tweet_text
    <<~TWEET
      #{title} -- #{most_recent_stat.page_views_count} views

      #DEVstat #devto
    TWEET
  end
end
