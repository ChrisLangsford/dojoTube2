class AddAttachmentThumbnailToGenres < ActiveRecord::Migration
  def self.up
    change_table :genres do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :genres, :thumbnail
  end
end
