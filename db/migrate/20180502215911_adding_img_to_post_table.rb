class AddingImgToPostTable < ActiveRecord::Migration[5.2]
  def change
    add_column(:posts, :image, :varbinary)
  end
end
