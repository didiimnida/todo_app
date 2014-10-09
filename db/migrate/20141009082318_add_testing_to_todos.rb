class AddTestingToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :testing, :boolean
  end
end
