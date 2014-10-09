class AddVoiceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :voice, :boolean
  end
end
