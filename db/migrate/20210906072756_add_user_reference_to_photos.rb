class AddUserReferenceToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :photos, :users
    add_index :photos, :user_id
    change_column_null :photos, :user_id, false
  end
end
