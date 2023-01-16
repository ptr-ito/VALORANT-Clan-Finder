class AddRankIdToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :rank_id, :integer
    add_reference :users, :rank, foreign_key: true
  end
end
