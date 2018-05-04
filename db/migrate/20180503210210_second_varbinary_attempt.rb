class SecondVarbinaryAttempt < ActiveRecord::Migration[5.2]
  def change
    add_column(:posts, :image, :varbinary)
    add_column(:users, :propic, :varbinary)
  end
end
