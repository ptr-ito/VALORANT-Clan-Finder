class AddDefaultRankIdToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :rank_id, from: nil, to: 1)
  end
end
