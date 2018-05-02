class Profile < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :password
      t.string :email
      t.integer :birthday
    end
  end
end
