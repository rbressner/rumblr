class NewPost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :firstname
      t.string :title
      t.text :content
      t.blob :image
      t.datetime :created_at
    end
  end
end
