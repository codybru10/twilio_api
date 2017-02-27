class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer "user_id"
      t.string "first_name"
      t.string "last_name"
      t.integer "phone_number"
    end
    add_column :users, :send_number, :integer
    add_column :users, :receive_number, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
