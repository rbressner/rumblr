class NewPost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :username
      t.string :title
      t.text :content
      t.datetime :created_at
    end
  end
end
