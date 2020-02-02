class ToDoTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task
      t.string :status, default: 'pending'
      t.timestamps
    end 
  end
end
