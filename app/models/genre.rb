class Genre < ActiveRecord::Base
	has_many :videos

	validates :genre_name, presence: true
	validates :genre_name, uniqueness: true 
end
