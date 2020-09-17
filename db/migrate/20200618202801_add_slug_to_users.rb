class AddSlugToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
    remove_column :posts, :content
  end
end
