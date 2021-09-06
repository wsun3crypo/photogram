class AddUsersReferenceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :posts, :users, column: :users_id
    add_index :posts, :users_id
    change_column_null :posts, :users_id, false
  end
end
