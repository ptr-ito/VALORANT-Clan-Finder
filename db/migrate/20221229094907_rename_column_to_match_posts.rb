class RenameColumnToMatchPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :match_posts, :rank_id, :rank
    rename_column :match_posts, :mode_id, :mode
    rename_column :match_posts, :mood_id, :mood
  end
end
