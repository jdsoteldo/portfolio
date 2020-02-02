class DropToDo < ActiveRecord::Migration[6.0]
  def change
    drop_table :taskillo
  end
end
