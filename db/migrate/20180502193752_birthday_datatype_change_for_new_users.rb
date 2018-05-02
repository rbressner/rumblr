class BirthdayDatatypeChangeForNewUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column(:users, :birthday)
    add_column(:users, :birthday, :date)
  end
end
