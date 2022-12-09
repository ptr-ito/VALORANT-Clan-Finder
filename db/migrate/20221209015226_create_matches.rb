class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches, id: false do |t|
      t.string :id, limit: 36, null: false, index: true, unique: true, primary_key: true, comment: "プライマリキー"
      t.string :title, null: false
      t.text :body, nill: false
      t.integer :status, default: 0, null: false, limit: 1
      t.references :user, type: :string, null: false, foreign_key: true
      t.integer :rank_id, null: false
      t.integer :mode_id, null: false

      t.timestamps
    end
  end
end

