class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :uploader
      t.string :category_id
      t.string :video_descrip
      t.string :rank
      t.string :file_url

      t.timestamps
    end
  end
end
