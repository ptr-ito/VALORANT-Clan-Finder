class CreateMatchRanks < ActiveRecord::Migration[7.0]
  def change
    create_table :match_ranks do |t|
      t.references :match_post, null: false, foreign_key: true
      t.references :rank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
