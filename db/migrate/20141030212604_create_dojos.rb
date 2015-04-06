class CreateDojos < ActiveRecord::Migration
  def change
    create_table :dojos do |t|
      t.string :name

      t.timestamps
    end
  end
end
