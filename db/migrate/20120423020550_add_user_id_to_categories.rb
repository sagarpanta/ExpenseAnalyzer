class AddUserIdToCategories < ActiveRecord::Migration
  def change
	add_column :categories , :user_id , :integer
  end
  
  def self.down
	remove_column :categories , :user_id 
  end
end
