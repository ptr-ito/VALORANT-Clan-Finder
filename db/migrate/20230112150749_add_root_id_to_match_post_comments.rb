class AddRootIdToMatchPostComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :match_post_comments, :root, foreign_key: { to_table: :match_post_comments }
  end
end
