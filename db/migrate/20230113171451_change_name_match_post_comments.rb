class ChangeNameMatchPostComments < ActiveRecord::Migration[7.0]
  def change
    rename_table :match_post_comments, :comments
  end
end
