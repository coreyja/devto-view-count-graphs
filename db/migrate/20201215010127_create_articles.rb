# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :external_id, null: false, index: { unique: true }
      t.string :slug, null: false
      t.string :title, null: false
      t.string :cover_image, null: true

      t.datetime :published_at, null: true

      t.timestamps
    end
  end
end
