class AddSmsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sms, :boolean
  end
end
