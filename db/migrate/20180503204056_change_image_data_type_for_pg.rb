class ChangeImageDataTypeForPg < ActiveRecord::Migration[5.2]
  def change
    remove_column(:posts, :image)
    add_column(:posts, :image, :bytea)
    remove_column(:users, :propic)
    add_column(:users, :propic, :bytea)
  end
end
