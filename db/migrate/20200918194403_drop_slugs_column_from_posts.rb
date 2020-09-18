class DropSlugsColumnFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :slug
  end
end
