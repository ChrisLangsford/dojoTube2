class CreatePermittedParams < ActiveRecord::Migration
  def change
    create_table :permitted_params do |t|

      t.timestamps
    end
  end
end
