class ChangeDefaultToMatchPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:match_posts, :mode_id, from: 1, to: nil)
    change_column_default(:match_posts, :mood_id, from: 1, to: nil)
  end
end
