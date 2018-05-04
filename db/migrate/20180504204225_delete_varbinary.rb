class DeleteVarbinary < ActiveRecord::Migration[5.2]
  def change
    remove_column(:posts, :image)
    add_column(:posts, :image, :string)
    remove_column(:users, :propic)
    add_column(:users, :propic, :string)
  end
end
