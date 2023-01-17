class ChangeDefaultToTabels < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :rank_id, from: 0, to: 1)
    change_column_default(:users, :highest_rank_id, from: 0, to: 1)
  end
end
