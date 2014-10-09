class AddDeliveredToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :delivered, :boolean
  end
end
