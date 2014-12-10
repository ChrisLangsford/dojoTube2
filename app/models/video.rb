class Video < ActiveRecord::Base
	has_one :category

	has_attached_file :file,
	#:url => "/system/:class/:attachment/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/:class/:basename.:extension"
	do_not_validate_attachment_file_type :file
end
