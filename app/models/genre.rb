class Genre < ActiveRecord::Base
	has_many :videos

	validates :genre_name, presence: true
	validates :genre_name, uniqueness: true 

	has_attached_file :thumbnail, styles: { :medium => "296x210#", :thumb => "196x110#"}, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
end
