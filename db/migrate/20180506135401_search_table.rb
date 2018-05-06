class SearchTable < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keyword
      t.integer :user_id
    end
  end
end
