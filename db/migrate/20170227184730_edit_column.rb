class EditColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :receive_number
    remove_column :users, :send_number
    add_column :users, :send_number, :string
    add_column :users, :receive_number, :string
  end
end
