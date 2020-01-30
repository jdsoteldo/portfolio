class RoleDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :role, :string, default: "user"
  end
end
