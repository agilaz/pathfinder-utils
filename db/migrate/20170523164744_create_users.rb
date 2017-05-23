class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string "username"
      t.string "password_digest"
      t.timestamps
    end
    add_index(:users, :username)
    add_column(:characters, :user_id, :integer)
    add_index(:characters, :user_id)
  end
end
