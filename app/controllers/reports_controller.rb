class ReportsController < ApplicationController
	def active_users
		@active_users = User.all.where(active: "true").count
		@inactive_users = User.all.count - @active_users
	end
end
