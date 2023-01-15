class CreateUserAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_agents do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
