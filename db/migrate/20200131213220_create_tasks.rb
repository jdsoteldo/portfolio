class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :taskillo do |t|
      t.string :task
      t.string :status, default: 'pending'
      t.timestamps
    end
  end
end
