class ChangeColumnAddNotnullOnMatches < ActiveRecord::Migration[7.0]
  def change
    change_column :matches, :rank_id, :integer, null: false
    change_column :matches, :mode_id, :integer, null: false
  end
end
