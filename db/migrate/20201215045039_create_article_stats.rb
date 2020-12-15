class CreateArticleStats < ActiveRecord::Migration[6.0]
  def change
    create_table :article_stats do |t|
      t.belongs_to :article, null: false, index: true, foreign_key: true

      t.integer :comments_count, null: false
      t.integer :positive_reactions_count, null: false
      t.integer :public_reactions_count, null: false
      t.integer :page_views_count, null: false

      t.timestamps
    end
  end
end
