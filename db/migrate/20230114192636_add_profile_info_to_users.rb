class AddProfileInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :twitter_name, :string
    add_column :users, :youtube_url, :string
    add_column :users, :started_on_val, :string
    add_column :users, :ingame_name, :string
    add_column :users, :highest_rank, :string
  end
end
