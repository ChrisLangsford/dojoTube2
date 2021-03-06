class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :active, :boolean
    add_column :users, :rank, :string
    add_column :users, :username, :string
    add_reference :users, :dojo, index: true
  end
end
