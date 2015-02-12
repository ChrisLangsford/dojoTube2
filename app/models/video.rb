class Video < ActiveRecord::Base
	belongs_to :genre
	belongs_to :user
	is_impressionable

end
