class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :match_post, null: false, foreign_key: true
      t.references :root, null: false, foreign_key: { to_table: :comments }
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
