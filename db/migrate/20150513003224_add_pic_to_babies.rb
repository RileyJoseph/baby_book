class AddPicToBabies < ActiveRecord::Migration
  def change
    add_column :babies, :profile_pic, :string
  end
end
