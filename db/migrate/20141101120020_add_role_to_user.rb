class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :adult, :boolean
    add_column :users, :active, :boolean
    add_column :users, :rank, :string
  end
end
