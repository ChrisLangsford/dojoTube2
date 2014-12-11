class Video < ActiveRecord::Base
	has_one :category

	has_attached_file :file, 
		storage: 's3', 
		s3_credentials: "#{Rails.root}/config/aws.yml", 
		bucket: "dojo-tube-in";
	
	do_not_validate_attachment_file_type :file
end
