class ForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_column(:posts, :profile_id, :integer)
    add_column(:profiles, :user_id, :integer)
  end
end
