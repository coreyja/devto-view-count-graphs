# frozen_string_literal: true

class ArticleStat < ApplicationRecord
  def self.from_api!(hash)
    attrs = hash.slice(
      'comments_count',
      'positive_reactions_count',
      'public_reactions_count',
      'page_views_count'
    )
    create!(attrs)
  end
end
