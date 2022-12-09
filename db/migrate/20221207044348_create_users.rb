class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, limit: 36, null: false, index: true, unique: true, primary_key: true, comment: "プライマリキー"
      t.string :sub, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
