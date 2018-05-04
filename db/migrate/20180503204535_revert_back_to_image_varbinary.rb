class RevertBackToImageVarbinary < ActiveRecord::Migration[5.2]
  def change
    remove_column(:posts, :image)
    remove_column(:users, :propic)
  end
end
