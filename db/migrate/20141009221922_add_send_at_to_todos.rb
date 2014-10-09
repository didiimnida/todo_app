class AddSendAtToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :send_at, :datetime
  end
end
