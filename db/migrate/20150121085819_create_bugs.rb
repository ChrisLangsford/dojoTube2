class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :user
      t.text :description

      t.timestamps
    end
  end
end
