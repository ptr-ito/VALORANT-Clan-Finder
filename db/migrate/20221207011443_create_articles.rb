class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: false do |t|
      t.string   "id", limit: 36, null: false, index: true, unique: true, primary_key: true
      t.timestamps
    end
  end
end
