class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :categories
      t.integer :likes
      t.string :author
      t.string :type
      t.string :collaborators
      t.string :software
      t.integer :year
      t.integer :status
      t.integer :reading_time
      t.timestamps
    end
  end
end
