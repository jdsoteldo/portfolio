class AddNicknameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :nickname, :string
  end
end
