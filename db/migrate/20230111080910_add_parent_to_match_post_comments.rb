class AddParentToMatchPostComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :match_post_comments, :parent, foreign_key: { to_table: :match_post_comments }
  end
end
