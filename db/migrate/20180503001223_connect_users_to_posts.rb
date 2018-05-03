class ConnectUsersToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column(:posts, :profile_id)
    add_column(:posts, :user_id, :integer)
  end
end
