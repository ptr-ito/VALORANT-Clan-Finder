class AddHighestRankIdToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :highest_rank, :string
    add_column :users, :highest_rank_id, :integer, null: false, default: 1
  end
end
