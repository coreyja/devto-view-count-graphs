# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :article_stats, dependent: :destroy

  def self.from_api!(hash)
    attrs = hash.slice('slug', 'cover_image', 'title', 'published_at')
    create_with(attrs)
      .create_or_find_by(external_id: hash['id'])
      .tap { |a| a.update!(attrs) }
  end
end
