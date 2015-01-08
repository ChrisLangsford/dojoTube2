class Category < ActiveRecord::Base
	has_many :videos

	validates :category_name, presence: true
	validates :category_name, uniqueness: true 
end
