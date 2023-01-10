class RemoveRankIdFromMatchPosts < ActiveRecord::Migration[7.0]
  def up
    remove_column :match_posts, :rank_id
  end

  def down
    add_column :match_posts, :rank_id, :integer, default: 1, null: false
  end
end
