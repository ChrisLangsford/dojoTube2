class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :active, :boolean
    add_column :users, :rank, :string
    add_column :users, :dojo_id, :string
    add_column :users, :username, :string
  end
end
