class CreateMatchPostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :match_post_comments do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :match_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
