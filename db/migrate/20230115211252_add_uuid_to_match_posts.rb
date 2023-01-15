class AddUuidToMatchPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :match_posts, :uuid, :string, null: false
    add_column :match_posts, :uuid, :string, null: false
    add_index :match_posts, :uuid, unique: true
  end
end
