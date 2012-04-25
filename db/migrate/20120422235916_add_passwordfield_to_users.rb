class AddPasswordfieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_password, :string
	add_column :users, :encrypted_password_confirmation, :string
  end
  
   def self.down
    remove_column :users, :encrypted_password
	remove_column :users, :encrypted_password_confirmation
  end
end


