class RemoveReadingTimeFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :reading_time
  end
end
