class Video < ActiveRecord::Base
	has_one :category
	has_one :user

end
