class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categorytype
      t.decimal :expense
      t.date :date_spent
      t.integer :week_id
      t.integer :month_id
      t.string :month_name
      t.integer :year

      t.timestamps
    end
  end
end
