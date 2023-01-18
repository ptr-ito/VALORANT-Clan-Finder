class ChangeNotnullToComments < ActiveRecord::Migration[7.0]
  def change
    change_column_null :comments, :root_id, false: true
  end
end
