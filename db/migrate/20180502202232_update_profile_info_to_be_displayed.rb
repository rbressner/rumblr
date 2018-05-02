class UpdateProfileInfoToBeDisplayed < ActiveRecord::Migration[5.2]
  def change
    remove_column(:profiles, :password)
    remove_column(:profiles, :email)
    remove_column(:profiles, :birthday)
  end
end
