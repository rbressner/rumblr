class DeleteVarbinary < ActiveRecord::Migration[5.2]
  def change
    add_column(:posts, :image, :string)
    add_column(:users, :propic, :string)
  end
end
