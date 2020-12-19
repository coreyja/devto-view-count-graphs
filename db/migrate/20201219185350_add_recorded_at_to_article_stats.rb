class AddRecordedAtToArticleStats < ActiveRecord::Migration[6.0]
  def up
    add_column :article_stats, :recorded_at, :datetime, index: true
    execute <<~SQL
      UPDATE article_stats
      SET recorded_at = created_at
      WHERE recorded_at IS NULL
    SQL
    change_column_null :article_stats, :recorded_at, false
  end

  def down
    remove_column :article_stats, :recorded_at, :datetime
  end
end
