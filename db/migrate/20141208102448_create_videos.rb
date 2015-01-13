class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :video_descrip
      t.string :rank
      t.string :file_url

      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
