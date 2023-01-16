class ChangeDefaultToTabels < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :rank_id, from: 1, to: 0)
    change_column_default(:users, :highest_rank_id, from: 1, to: 0)
  end
end
