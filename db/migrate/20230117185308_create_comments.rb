class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :commentable, polymorphic: true, null: false
      t.references :root, null: false, foreign_key: true, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
