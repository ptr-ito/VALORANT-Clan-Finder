class CreateMatchPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :match_posts do |t|
      t.text :content, null: false
      t.integer :rank_id, default: 1, null: false
      t.integer :mode_id, default: 1, null: false
      t.integer :mood_id, default: 1, null: false
      t.integer :status, default: 0, null: false, limit: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
